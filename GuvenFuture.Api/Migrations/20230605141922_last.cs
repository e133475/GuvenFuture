using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GuvenFuture.Api.Migrations
{
    /// <inheritdoc />
    public partial class last : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<int>(
                name: "ReminderTimePeriod",
                table: "AppointmentActions",
                type: "int",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.CreateTable(
                name: "MedicalHistoryView",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProviderID = table.Column<int>(type: "int", nullable: false),
                    ProviderLocationId = table.Column<int>(type: "int", nullable: false),
                    PatientId = table.Column<int>(type: "int", nullable: false),
                    DoctorId = table.Column<int>(type: "int", nullable: false),
                    SaglikKurulusu = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SaglikKurulusuTesisKodu = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    MuayeneYeri = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    MuayeneOdaNo = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    HastaAdi = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    HastaTC = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DoktorAdi = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DoktorTC = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ZiyaretKayitTuru = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    RandevuKaydiniYapan = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    RandevuTarihi = table.Column<DateTime>(type: "datetime2", nullable: true),
                    RandevuBaslamaSaati = table.Column<DateTime>(type: "datetime2", nullable: true),
                    RandevuBitisSaati = table.Column<DateTime>(type: "datetime2", nullable: true),
                    RandevuDurumu = table.Column<int>(type: "int", nullable: true),
                    RandevuNotu = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ZiyaretKayidiniYapan = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ZiyaretKayitTarihi = table.Column<DateTime>(type: "datetime2", nullable: true),
                    ZiyaretTarihi = table.Column<DateTime>(type: "datetime2", nullable: true),
                    HastaSikayeti = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Teshis = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    HastaKritikSeviyesi = table.Column<int>(type: "int", nullable: true),
                    ProvisionNumber = table.Column<int>(type: "int", nullable: true),
                    IslemKaydiniYapan = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IslemKayitTarihi = table.Column<DateTime>(type: "datetime2", nullable: true),
                    IslemKayitTuru = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ReceteNumarasi = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    MalzemeTuru = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    MalzemeAdi = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Barcode = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SUTCode = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    MalzemeBirimi = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    VerilenMiktar = table.Column<double>(type: "float", nullable: true),
                    KullanimDozu = table.Column<int>(type: "int", nullable: true),
                    Fiyat = table.Column<double>(type: "float", nullable: true),
                    ParaBirimi = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MedicalHistoryView", x => x.Id);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "MedicalHistoryView");

            migrationBuilder.AlterColumn<string>(
                name: "ReminderTimePeriod",
                table: "AppointmentActions",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);
        }
    }
}
