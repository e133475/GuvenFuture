using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore.Migrations;

namespace GuvenFuture.DataAccess.Context.Views
{
    public class MedicalHistoryView : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql("\r\ncreate view [dbo].[MedicalHistoryView]\r\nas\r\nSELECT\r\np.AutoId as ProviderID, ploc.AutoId as ProviderLocationId,patUser.AutoId PatientId, docUser.AutoId as DoctorId,\r\np.Name as SaglikKurulusu,p.TesisKodu SaglikKurulusuTesisKodu, ploc.Name MuayeneYeri,ploc.LocationNo MuayeneOdaNo,\r\npatUser.FullName as HastaAdi,patUser.TCNo as HastaTC, docUser.FullName as DoktorAdi, docUser.TCNo as DoktorTC, \r\n\r\nIIF(mhis.AppointmentActionId IS NOT NULL, 'Randevulu Hasta', 'Poliklinikten Giris') ZiyaretKayitTuru,\r\n\r\nappAccUser.FullName RandevuKaydiniYapan, cast(appAc.AppointmentDate as date) RandevuTarihi,\r\ncast(appAc.StartTime as time) RandevuBaslamaSaati,cast(appAc.EndTime as time) RandevuBitisSaati,\r\nappAc.AppointmentStatus as RandevuDurumu, appAc.AppointmentStatusNote as RandevuNotu,\r\n\r\ncreMhisUser.FullName ZiyaretKayidiniYapan,mhis.CreatedDate ZiyaretKayitTarihi, \r\nmhis.ActionDate ZiyaretTarihi, mhis.PaitentComplaint HastaSikayeti, \r\nmhis.DoctorDiagnosis Teshis,mhis.Severity HastaKritikSeviyesi, mhis.ProvisionNumber, \r\n\r\ncreMdetUser.FullName as IslemKaydiniYapan, mdet.CreatedDate as IslemKayitTarihi,\r\nIIF(mdet.IsPrescription=1, 'Recete', 'Hasta Stok') IslemKayitTuru,\r\nmdet.PrescriptionNumber ReceteNumarasi,\r\n\r\nmat.StokType MalzemeTuru, mat.StockName MalzemeAdi, mat.Barcode,mat.SUTCode,mat.MaterialUnitName as MalzemeBirimi, \r\nmdet.Quantity as VerilenMiktar, mdet.UsegeDose as KullanimDozu,\r\nmdet.Quantity * mat.UnitPriceAvg as Fiyat, mat.CurrencyName as ParaBirimi\r\n\r\nFROM dbo.PatientMedicalHistories mhis\r\n     LEFT OUTER JOIN dbo.PatientMedicalHistoryDetails mdet ON mhis.AutoId = mdet.PatientMedicalHistoryId\r\n     LEFT OUTER JOIN dbo.AppointmentActions appAc ON appAc.AutoId = mhis.AppointmentActionId\r\n     LEFT OUTER JOIN dbo.Providers p ON p.AutoId = mhis.ProviderId\r\n     LEFT OUTER JOIN dbo.ProviderLocations ploc ON ploc.AutoId = mhis.ProviderLocationId\r\n     LEFT OUTER JOIN dbo.Users appAccUser ON appAccUser.AutoId = appAc.CreatedBy\r\n     LEFT OUTER JOIN dbo.Users creMhisUser ON creMhisUser.AutoId = mhis.CreatedBy\r\n     LEFT OUTER JOIN dbo.Users creMdetUser ON creMdetUser.AutoId = mdet.CreatedBy\r\n     LEFT OUTER JOIN dbo.Users patUser ON patUser.AutoId = mhis.PatientUserId\r\n     LEFT OUTER JOIN dbo.Users docUser ON docUser.AutoId = mhis.DoctorUserId\r\n     LEFT OUTER JOIN dbo.Materials mat ON mat.AutoId = mdet.MaterialId\r\nGO");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql(@"DROP VIEW dbo.MedicalHistoryView;");
        }
    }
}
