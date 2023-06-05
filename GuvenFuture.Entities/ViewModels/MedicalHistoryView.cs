using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GuvenFuture.Entities.ViewModels
{
    public class MedicalHistoryView
    {
        public int Id { get; set; }
        public int ProviderID { get; set; }
        public int ProviderLocationId { get; set; }
        public int PatientId { get; set; }
        public int DoctorId { get; set; }
        public string? SaglikKurulusu { get; set; }
        public string? SaglikKurulusuTesisKodu { get; set; }
        public string? MuayeneYeri { get; set; }
        public string? MuayeneOdaNo { get; set; }
        public string? HastaAdi { get; set; }
        public string? HastaTC { get; set; }
        public string? DoktorAdi { get; set; }
        public string? DoktorTC { get; set; }
        public string? ZiyaretKayitTuru { get; set; }
        public string? RandevuKaydiniYapan { get; set; }
        public DateTime? RandevuTarihi { get; set; }
        public DateTime? RandevuBaslamaSaati { get; set; }
        public DateTime? RandevuBitisSaati { get; set; }
        public int? RandevuDurumu { get; set; }
        public string? RandevuNotu { get; set; }
        public string? ZiyaretKayidiniYapan { get; set; }
        public DateTime? ZiyaretKayitTarihi { get; set; }
        public DateTime? ZiyaretTarihi { get; set; }
        public string? HastaSikayeti { get; set; }
        public string? Teshis { get; set; }
        public int? HastaKritikSeviyesi { get; set; }
        public int? ProvisionNumber { get; set; }
        public string? IslemKaydiniYapan { get; set; }
        public DateTime? IslemKayitTarihi { get; set; }
        public string? IslemKayitTuru { get; set; }
        public string? ReceteNumarasi { get; set; }
        public string? MalzemeTuru { get; set; }
        public string? MalzemeAdi { get; set; }
        public string? Barcode { get; set; }
        public string? SUTCode { get; set; }
        public string? MalzemeBirimi { get; set; }
        public double? VerilenMiktar { get; set; }
        public int? KullanimDozu { get; set; }
        public double? Fiyat { get; set; }
        public string? ParaBirimi { get; set; }

    }
}
