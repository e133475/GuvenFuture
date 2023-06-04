using Azure;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Microsoft.AspNetCore.Identity;
using GuvenFuture.Entities.Computeds.DTOs;
using GuvenFuture.Business.User;
using GuvenFuture.Core.Models;

namespace GuvenFuture.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        public IConfiguration _configuration;
        private readonly UserBusiness _userBusiness;

        public AuthController(IConfiguration config, UserBusiness userBusiness)
        {
            _configuration = config;
            _userBusiness = userBusiness;
        }

        [HttpPost("Login")]
        public async Task<IActionResult> Login(UserAuthModel _userData)
        {
            ResultModel<Entities.User.User> response = await _userBusiness.Login(_userData.TCNo, _userData.PassWord);
            if (response.IsSucces)
            {
                if (response.ResultData != null)
                {
                    //create claims details based on the user information
                    var claims = new[] {
                        new Claim("UserId", response.ResultData.AutoId.ToString())
                    };

                    var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));
                    var signIn = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
                    var token = new JwtSecurityToken(
                        _configuration["Jwt:Issuer"],
                        _configuration["Jwt:Audience"],
                        claims,
                        expires: DateTime.UtcNow.AddHours(12),
                        signingCredentials: signIn);

                    ResultModel<string> resToken = new();
                    resToken.ResultData = new JwtSecurityTokenHandler().WriteToken(token);
                    return Ok(resToken);
                }
                else
                {
                    return BadRequest("Invalid credentials");
                }
            }
            else
            {
                return BadRequest(response);
            }
        }

        [HttpPost("Register")]
        public async Task<IActionResult> Register(Entities.Computeds.DTOs.UserAuthModel _userData)
        {
            ResultModel<bool> response = await _userBusiness.Register(_userData);
            return response.IsSucces ? Ok(response) : BadRequest(response);
        }

    }
}
