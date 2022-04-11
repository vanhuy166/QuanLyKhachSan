using QuanLyKhachSan.Jwt;
using QuanLyKhachSan.Models;
using QuanLyKhachSan.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Security.Principal;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http.Filters;

namespace QuanLyKhachSan.Filters
{
    public class JwtAuthenticationAttribute : Attribute, IAuthenticationFilter
    {
        public string Realm { get; set; }
        public bool AllowMultiple => false;

        public async Task AuthenticateAsync(HttpAuthenticationContext context, CancellationToken cancellationToken)
        {
            var request = context.Request;
            var authorization = request.Headers.Authorization;

            if (authorization == null || authorization.Scheme != "Bearer")
                return;

            if (string.IsNullOrEmpty(authorization.Parameter))
            {
                context.ErrorResult = new AuthenticationFailureResult("Missing Jwt Token", request);
                return;
            }

            var token = authorization.Parameter;
            var principal = await AuthenticateJwtToken(token);

            if (principal == null)
                context.ErrorResult = new AuthenticationFailureResult("Invalid token", request);

            else
                context.Principal = principal;
        }

        private static bool ValidateToken(string token, out string username, out List<Role> roles)
        {
            username = null;
            roles = null;

            var simplePrinciple = JwtManager.GetPrincipal(token);
            var identity = simplePrinciple?.Identity as ClaimsIdentity;

            if (identity == null)
                return false;

            if (!identity.IsAuthenticated)
                return false;

            var usernameClaim = identity.FindFirst(ClaimTypes.Name);
            username = usernameClaim?.Value;

            if (string.IsNullOrEmpty(username))
                return false;

            var roleClaims = identity.FindAll(ClaimTypes.Role);

            KhachSanService ks = KhachSanService.getInstance();
            string thisUsername = usernameClaim?.Value;
            
            TaiKhoan tk = ks.TaiKhoans.SingleOrDefault(
                acc => acc.TenTK.Equals(thisUsername));
            if (tk == null)
                return false;
                

            List<Role> userRoles = tk.Roles.ToList();
            foreach (var role in roleClaims)
            {
                string roleValue = role.Value;
                Role actualRole = userRoles.SingleOrDefault(
                    thisRole => thisRole.Equals(roleValue));

                if (actualRole == null)
                    return false;
            }

            roles = userRoles;
            return true;
        }

        protected Task<IPrincipal> AuthenticateJwtToken(string token)
        {
            if (ValidateToken(token, out var username, out var roles))
            {
                var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, username),
                };

                foreach (var role in roles)
                {
                    claims.Add(new Claim(ClaimTypes.Role, role.Ten));
                }

                var identity = new ClaimsIdentity(claims, "Jwt");
                IPrincipal user = new ClaimsPrincipal(identity);

                return Task.FromResult(user);
            }

            return Task.FromResult<IPrincipal>(null);
        }

        public Task ChallengeAsync(HttpAuthenticationChallengeContext context, CancellationToken cancellationToken)
        {
            Challenge(context);
            return Task.FromResult(0);
        }

        private void Challenge(HttpAuthenticationChallengeContext context)
        {
            string parameter = null;

            if (!string.IsNullOrEmpty(Realm))
                parameter = "realm=\"" + Realm + "\"";

            context.ChallengeWith("Bearer", parameter);
        }
    }
}
