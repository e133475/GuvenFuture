using System.Net;
using GuvenFuture.Core.Models;
using GuvenFuture.Entities.Computeds.Enums;
using Microsoft.AspNetCore.Http;

namespace GuvenFuture.Api.Core.Middlewares
{
    public class PermissionsMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<PermissionsMiddleware> _logger;

        public PermissionsMiddleware(
            RequestDelegate next,
            ILogger<PermissionsMiddleware> logger)
        {
            _next = next;
            _logger = logger;
        }

        public async Task InvokeAsync(HttpContext context)
        {
            // 1 - if the request is not authenticated, nothing to do
            if (context.User.Identity == null || !context.User.Identity.IsAuthenticated)
            {
                await _next(context);
                return;
            }

            var cancellationToken = context.RequestAborted;

            if (context.User.FindFirst("UserType")?.ToString() == EUserTypes.Guest.ToString())
            {
                ResultModel<bool> result = new();
                result.ResultData = false;
                result.IsSucces = true;
                result.Message = "You are not authorized for this action.";
                context.Response.StatusCode = (int)HttpStatusCode.Unauthorized;
                context.Response.ContentType = "application/json";   //add this line.....
                await context.Response.WriteAsync(Newtonsoft.Json.JsonConvert.SerializeObject(result), cancellationToken: cancellationToken);
                return;
            }

            await _next(context);
        }
    }
}
