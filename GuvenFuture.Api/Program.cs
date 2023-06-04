using FluentValidation;
using GuvenFuture.Api.Extensions;
using GuvenFuture.Business.AppointmentActions;
using GuvenFuture.Business.BackgroundJobs;
using GuvenFuture.Business.BackgroundJobs.Core;
using GuvenFuture.DataAccess.Context;
using Hangfire;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;

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

app.MapControllers();

RecurringJob.AddOrUpdate<MailRecursiveJob>(job => job.Execute(), Cron.Minutely());
RecurringJob.AddOrUpdate<SMSRecursiveJob>(job => job.Execute(), Cron.Minutely());

app.Run();



//BackgroundJob.Schedule(() => Console.WriteLine("You checkout new product into your checklist!"), TimeSpan.FromSeconds(30));

//using (var server = new BackgroundJobServer())
//{
//    Console.WriteLine("Hangfire Server started. Press any key to exit...");
//    Console.ReadKey();
//}