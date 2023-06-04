using System.Text;
using FluentValidation;
using GuvenFuture.Business.AppointmentActions;
using GuvenFuture.Business.AppointmentReminderQueue;
using GuvenFuture.Business.AppointmentSetting;
using GuvenFuture.Business.Material;
using GuvenFuture.Business.PatientMedicalHistory;
using GuvenFuture.Business.PatientMedicalHistoryDetail;
using GuvenFuture.Business.Provider;
using GuvenFuture.Business.ProviderLocation;
using GuvenFuture.Business.User;
using GuvenFuture.Business.UserDetail;
using GuvenFuture.DataAccess.Context;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;

namespace GuvenFuture.Api.Extensions
{
    public static class ServiceExtension
    {
        public static void ServiceInit(this IServiceCollection service, ConfigurationManager configurationManager)
        {

            string conString = configurationManager.GetConnectionString("GBDb");

            service.AddDbContext<GuvenFutureContext>(options =>
                options.UseSqlServer(conString, b => b.MigrationsAssembly("GuvenFuture.Api")));


            service.AddScoped<UserBusiness, UserBusiness>();
            service.AddScoped<AppointmentActionBusiness, AppointmentActionBusiness>();
            service.AddScoped<AppointmentReminderQueueBusiness, AppointmentReminderQueueBusiness>();
            service.AddScoped<AppointmentSettingBusiness, AppointmentSettingBusiness>();
            service.AddScoped<MaterialBusiness, MaterialBusiness>();
            service.AddScoped<PatientMedicalHistoryBusiness, PatientMedicalHistoryBusiness>();
            service.AddScoped<PatientMedicalHistoryDetailBusiness, PatientMedicalHistoryDetailBusiness>();
            service.AddScoped<ProviderBusiness, ProviderBusiness>();
            service.AddScoped<ProviderLocationBusiness, ProviderLocationBusiness>();
            service.AddScoped<UserDetailBusiness, UserDetailBusiness>();


            service.AddValidatorsFromAssemblyContaining<AppointmentActionValidation>();
            service.AddValidatorsFromAssemblyContaining<AppointmentReminderQueueValidation>();
            service.AddValidatorsFromAssemblyContaining<AppointmentSettingValidation>();
            service.AddValidatorsFromAssemblyContaining<MaterialValidation>();
            service.AddValidatorsFromAssemblyContaining<PatientMedicalHistoryValidation>();
            service.AddValidatorsFromAssemblyContaining<PatientMedicalHistoryDetailValidation>();
            service.AddValidatorsFromAssemblyContaining<ProviderValidation>();
            service.AddValidatorsFromAssemblyContaining<ProviderLocationValidation>();
            service.AddValidatorsFromAssemblyContaining<UserValidation>();
            service.AddValidatorsFromAssemblyContaining<UserDetailValidation>();


            service.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(options =>
            {
                options.RequireHttpsMetadata = false;
                options.SaveToken = true;
                options.TokenValidationParameters = new TokenValidationParameters()
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidAudience = configurationManager["Jwt:Audience"],
                    ValidIssuer = configurationManager["Jwt:Issuer"],
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configurationManager["Jwt:Key"]))
                };
            });

            service.AddSwaggerGen(c =>
            {
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    In = ParameterLocation.Header,
                    Description = "Please insert JWT with Bearer into field",
                    Name = "Authorization",
                    Type = SecuritySchemeType.ApiKey
                });
                c.AddSecurityRequirement(new OpenApiSecurityRequirement {
               {
                 new OpenApiSecurityScheme
                 {
                   Reference = new OpenApiReference
                   {
                     Type = ReferenceType.SecurityScheme,
                     Id = "Bearer"
                   }
                  },
                  Array.Empty<string>()
                }
              });
            });

        }
    }
}
