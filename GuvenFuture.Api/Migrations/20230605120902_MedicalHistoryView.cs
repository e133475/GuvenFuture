using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GuvenFuture.Api.Migrations
{
    /// <inheritdoc />
    public partial class MedicalHistoryView : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "DoctorDiagnosis",
                table: "PatientMedicalHistories",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "EndTime",
                table: "AppointmentSettings",
                type: "datetime2",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "DoctorDiagnosis",
                table: "PatientMedicalHistories");

            migrationBuilder.DropColumn(
                name: "EndTime",
                table: "AppointmentSettings");
        }
    }
}
