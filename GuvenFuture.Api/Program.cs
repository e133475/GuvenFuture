using GuvenFuture.Api.Core.Middlewares;
using GuvenFuture.Api.Extensions;
using GuvenFuture.Business.AppointmentReminderQueue;
using GuvenFuture.Business.BackgroundJobs;
using GuvenFuture.Business.Core;
using GuvenFuture.DataAccess.Context;
using Hangfire;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();


//Hangfire

string conString = builder.Configuration.GetConnectionString("GBDb");
builder.Services.AddHangfire(x => x.UseSqlServerStorage(conString));
builder.Services.AddHangfireServer();


builder.Services.ServiceInit(builder.Configuration);

builder.Services.AddEndpointsApiExplorer();


var app = builder.Build();


// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();

    app.UseHangfireDashboard();
}
app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();

app.UseMiddleware<PermissionsMiddleware>();

app.MapControllers();

RecurringJob.AddOrUpdate<MailRecursiveJob>(job => job.Execute(), Cron.Minutely());

app.Run();