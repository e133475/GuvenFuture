using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GuvenFuture.Api.Migrations
{
    /// <inheritdoc />
    public partial class init : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "AppointmentActions",
                columns: table => new
                {
                    AutoId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProviderId = table.Column<int>(type: "int", nullable: false),
                    ProviderLocationId = table.Column<int>(type: "int", nullable: false),
                    AppointmentDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    StartTime = table.Column<DateTime>(type: "datetime2", nullable: true),
                    EndTime = table.Column<DateTime>(type: "datetime2", nullable: true),
                    PatientUserId = table.Column<int>(type: "int", nullable: true),
                    DoctorUserId = table.Column<int>(type: "int", nullable: true),
                    ReminderTimePeriod = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ReminderCount = table.Column<int>(type: "int", nullable: true),
                    ReminderType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    AppointmentStatus = table.Column<int>(type: "int", nullable: true),
                    AppointmentStatusNote = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DataStatus = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AppointmentActions", x => x.AutoId);
                });

            migrationBuilder.CreateTable(
                name: "AppointmentReminderQueues",
                columns: table => new
                {
                    AutoId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProviderId = table.Column<int>(type: "int", nullable: false),
                    AppointmentActionId = table.Column<int>(type: "int", nullable: false),
                    ReminderDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    ReminderType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ReminderStatus = table.Column<int>(type: "int", nullable: true),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DataStatus = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AppointmentReminderQueues", x => x.AutoId);
                });

            migrationBuilder.CreateTable(
                name: "AppointmentSettings",
                columns: table => new
                {
                    AutoId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProviderLocationId = table.Column<int>(type: "int", nullable: false),
                    AppointmentDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    StartTime = table.Column<DateTime>(type: "datetime2", nullable: true),
                    ConsultationTimePeriod = table.Column<int>(type: "int", nullable: true),
                    BreakTimePeriod = table.Column<int>(type: "int", nullable: true),
                    LunchTimeStart = table.Column<DateTime>(type: "datetime2", nullable: true),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DataStatus = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AppointmentSettings", x => x.AutoId);
                });

            migrationBuilder.CreateTable(
                name: "Materials",
                columns: table => new
                {
                    AutoId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProviderId = table.Column<int>(type: "int", nullable: false),
                    StokType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    StockName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SUTCode = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Barcode = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    MaterialUnitName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CurrencyName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UnitPrice = table.Column<float>(type: "real", nullable: true),
                    UnitPriceAvg = table.Column<float>(type: "real", nullable: true),
                    QuantityBalance = table.Column<float>(type: "real", nullable: true),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DataStatus = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Materials", x => x.AutoId);
                });

            migrationBuilder.CreateTable(
                name: "PatientMedicalHistories",
                columns: table => new
                {
                    AutoId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProviderId = table.Column<int>(type: "int", nullable: false),
                    ProviderLocationId = table.Column<int>(type: "int", nullable: true),
                    AppointmentActionId = table.Column<int>(type: "int", nullable: true),
                    PatientUserId = table.Column<int>(type: "int", nullable: true),
                    DoctorUserId = table.Column<int>(type: "int", nullable: true),
                    ActionDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    PaitentComplaint = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Severity = table.Column<int>(type: "int", nullable: true),
                    ProvisionNumber = table.Column<int>(type: "int", nullable: true),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DataStatus = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PatientMedicalHistories", x => x.AutoId);
                });

            migrationBuilder.CreateTable(
                name: "PatientMedicalHistoryDetails",
                columns: table => new
                {
                    AutoId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProviderId = table.Column<int>(type: "int", nullable: false),
                    ProviderLocationId = table.Column<int>(type: "int", nullable: true),
                    PatientMedicalHistoryId = table.Column<int>(type: "int", nullable: true),
                    IsPrescription = table.Column<bool>(type: "bit", nullable: false),
                    PrescriptionNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PatientUserId = table.Column<int>(type: "int", nullable: true),
                    DoctorUserId = table.Column<int>(type: "int", nullable: true),
                    MaterialId = table.Column<int>(type: "int", nullable: true),
                    MaterialUnitName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UsegeDose = table.Column<int>(type: "int", nullable: true),
                    Quantity = table.Column<float>(type: "real", nullable: true),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DataStatus = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PatientMedicalHistoryDetails", x => x.AutoId);
                });

            migrationBuilder.CreateTable(
                name: "ProviderLocations",
                columns: table => new
                {
                    AutoId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProviderId = table.Column<int>(type: "int", nullable: false),
                    ParentId = table.Column<int>(type: "int", nullable: true),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserId = table.Column<int>(type: "int", nullable: true),
                    LocationNo = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DataStatus = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProviderLocations", x => x.AutoId);
                });

            migrationBuilder.CreateTable(
                name: "Providers",
                columns: table => new
                {
                    AutoId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Address = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    TesisKodu = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DataStatus = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Providers", x => x.AutoId);
                });

            migrationBuilder.CreateTable(
                name: "UserDetails",
                columns: table => new
                {
                    AutoId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProviderId = table.Column<int>(type: "int", nullable: false),
                    UserId = table.Column<int>(type: "int", nullable: true),
                    Nation = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    BloodType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Country = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    City = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Address = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Gender = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Height = table.Column<int>(type: "int", nullable: true),
                    Weight = table.Column<float>(type: "real", nullable: true),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DataStatus = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserDetails", x => x.AutoId);
                });

            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    AutoId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProviderId = table.Column<int>(type: "int", nullable: false),
                    TCNo = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    FullName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PasswordHashed = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PasswordHashKey = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DataStatus = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.AutoId);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AppointmentActions");

            migrationBuilder.DropTable(
                name: "AppointmentReminderQueues");

            migrationBuilder.DropTable(
                name: "AppointmentSettings");

            migrationBuilder.DropTable(
                name: "Materials");

            migrationBuilder.DropTable(
                name: "PatientMedicalHistories");

            migrationBuilder.DropTable(
                name: "PatientMedicalHistoryDetails");

            migrationBuilder.DropTable(
                name: "ProviderLocations");

            migrationBuilder.DropTable(
                name: "Providers");

            migrationBuilder.DropTable(
                name: "UserDetails");

            migrationBuilder.DropTable(
                name: "Users");
        }
    }
}
