SELECT
p.Name as SaglikKurulusu,p.TesisKodu SaglikKurulusuTesisKodu, ploc.Name MuayeneYeri,ploc.LocationNo MuayeneOdaNo,
patUser.FullName as HastaAdi,patUser.TCNo as HastaTC, docUser.FullName as DoktorAdi, docUser.TCNo as DoktorTC, 

IIF(mhis.AppointmentActionId IS NOT NULL, 'Randevulu Hasta', 'Poliklinikten Giris') ZiyaretKayitTuru,

appAccUser.FullName RandevuKaydiniYapan, cast(appAc.AppointmentDate as date) RandevuTarihi,
cast(appAc.StartTime as time) RandevuBaslamaSaati,cast(appAc.EndTime as time) RandevuBitisSaati,
appAc.AppointmentStatus as RandevuDurumu, appAc.AppointmentStatusNote as RandevuNotu,

creMhisUser.FullName ZiyaretKayidiniYapan,mhis.CreatedDate ZiyaretKayitTarihi, 
mhis.ActionDate ZiyaretTarihi, mhis.PaitentComplaint HastaSikayeti, 
mhis.DoctorDiagnosis Teshis,mhis.Severity HastaKritikSeviyesi, mhis.ProvisionNumber, 

creMdetUser.FullName as IslemKaydiniYapan, mdet.CreatedDate as IslemKayitTarihi,
IIF(mdet.IsPrescription=1, 'Recete', 'Hasta Stok') IslemKayitTuru,
mdet.PrescriptionNumber ReceteNumarasi,

mat.StokType MalzemeTuru, mat.StockName MalzemeAdi, mat.Barcode,mat.SUTCode,mat.MaterialUnitName as MalzemeBirimi, 
mdet.Quantity as VerilenMiktar, mdet.UsegeDose as KullanimDozu,
mdet.Quantity * mat.UnitPriceAvg as Fiyat, mat.CurrencyName as ParaBirimi

FROM dbo.PatientMedicalHistories mhis
     LEFT OUTER JOIN dbo.PatientMedicalHistoryDetails mdet ON mhis.AutoId = mdet.PatientMedicalHistoryId
     LEFT OUTER JOIN dbo.AppointmentActions appAc ON appAc.AutoId = mhis.AppointmentActionId
     LEFT OUTER JOIN dbo.Providers p ON p.AutoId = mhis.ProviderId
     LEFT OUTER JOIN dbo.ProviderLocations ploc ON ploc.AutoId = mhis.ProviderLocationId
     LEFT OUTER JOIN dbo.Users appAccUser ON appAccUser.AutoId = appAc.CreatedBy
     LEFT OUTER JOIN dbo.Users creMhisUser ON creMhisUser.AutoId = mhis.CreatedBy
     LEFT OUTER JOIN dbo.Users creMdetUser ON creMdetUser.AutoId = mdet.CreatedBy
     LEFT OUTER JOIN dbo.Users patUser ON patUser.AutoId = mhis.PatientUserId
     LEFT OUTER JOIN dbo.Users docUser ON docUser.AutoId = mhis.DoctorUserId
     LEFT OUTER JOIN dbo.Materials mat ON mat.AutoId = mdet.MaterialId
