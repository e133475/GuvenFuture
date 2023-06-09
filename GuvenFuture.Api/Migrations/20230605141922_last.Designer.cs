﻿// <auto-generated />
using System;
using GuvenFuture.DataAccess.Context;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace GuvenFuture.Api.Migrations
{
    [DbContext(typeof(GuvenFutureContext))]
    [Migration("20230605141922_last")]
    partial class last
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.5")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("GuvenFuture.Entities.AppointmentActions.AppointmentAction", b =>
                {
                    b.Property<int>("AutoId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("AutoId"));

                    b.Property<DateTime?>("AppointmentDate")
                        .HasColumnType("datetime2");

                    b.Property<int?>("AppointmentStatus")
                        .HasColumnType("int");

                    b.Property<string>("AppointmentStatusNote")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("CreatedBy")
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("datetime2");

                    b.Property<int>("DataStatus")
                        .HasColumnType("int");

                    b.Property<int?>("DoctorUserId")
                        .HasColumnType("int");

                    b.Property<DateTime?>("EndTime")
                        .HasColumnType("datetime2");

                    b.Property<int?>("PatientUserId")
                        .HasColumnType("int");

                    b.Property<int?>("ProviderId")
                        .HasColumnType("int");

                    b.Property<int>("ProviderLocationId")
                        .HasColumnType("int");

                    b.Property<int?>("ReminderCount")
                        .HasColumnType("int");

                    b.Property<int?>("ReminderTimePeriod")
                        .HasColumnType("int");

                    b.Property<string>("ReminderType")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime?>("StartTime")
                        .HasColumnType("datetime2");

                    b.HasKey("AutoId");

                    b.ToTable("AppointmentActions");
                });

            modelBuilder.Entity("GuvenFuture.Entities.AppointmentReminderQueue.AppointmentReminderQueue", b =>
                {
                    b.Property<int>("AutoId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("AutoId"));

                    b.Property<int>("AppointmentActionId")
                        .HasColumnType("int");

                    b.Property<int>("CreatedBy")
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("datetime2");

                    b.Property<int>("DataStatus")
                        .HasColumnType("int");

                    b.Property<int?>("ProviderId")
                        .HasColumnType("int");

                    b.Property<DateTime?>("ReminderDate")
                        .HasColumnType("datetime2");

                    b.Property<int?>("ReminderStatus")
                        .HasColumnType("int");

                    b.Property<string>("ReminderType")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("AutoId");

                    b.ToTable("AppointmentReminderQueues");
                });

            modelBuilder.Entity("GuvenFuture.Entities.AppointmentSetting.AppointmentSetting", b =>
                {
                    b.Property<int>("AutoId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("AutoId"));

                    b.Property<DateTime?>("AppointmentDate")
                        .HasColumnType("datetime2");

                    b.Property<int?>("BreakTimePeriod")
                        .HasColumnType("int");

                    b.Property<int?>("ConsultationTimePeriod")
                        .HasColumnType("int");

                    b.Property<int>("CreatedBy")
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("datetime2");

                    b.Property<int>("DataStatus")
                        .HasColumnType("int");

                    b.Property<DateTime?>("EndTime")
                        .HasColumnType("datetime2");

                    b.Property<DateTime?>("LunchTimeStart")
                        .HasColumnType("datetime2");

                    b.Property<int?>("ProviderId")
                        .HasColumnType("int");

                    b.Property<int>("ProviderLocationId")
                        .HasColumnType("int");

                    b.Property<DateTime?>("StartTime")
                        .HasColumnType("datetime2");

                    b.HasKey("AutoId");

                    b.ToTable("AppointmentSettings");
                });

            modelBuilder.Entity("GuvenFuture.Entities.Material.Material", b =>
                {
                    b.Property<int>("AutoId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("AutoId"));

                    b.Property<string>("Barcode")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("CreatedBy")
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("datetime2");

                    b.Property<string>("CurrencyName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("DataStatus")
                        .HasColumnType("int");

                    b.Property<string>("Description")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("MaterialUnitName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("ProviderId")
                        .HasColumnType("int");

                    b.Property<float?>("QuantityBalance")
                        .HasColumnType("real");

                    b.Property<string>("SUTCode")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("StockName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("StokType")
                        .HasColumnType("nvarchar(max)");

                    b.Property<float?>("UnitPrice")
                        .HasColumnType("real");

                    b.Property<float?>("UnitPriceAvg")
                        .HasColumnType("real");

                    b.HasKey("AutoId");

                    b.ToTable("Materials");
                });

            modelBuilder.Entity("GuvenFuture.Entities.PatientMedicalHistory.PatientMedicalHistory", b =>
                {
                    b.Property<int>("AutoId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("AutoId"));

                    b.Property<DateTime?>("ActionDate")
                        .HasColumnType("datetime2");

                    b.Property<int?>("AppointmentActionId")
                        .HasColumnType("int");

                    b.Property<int>("CreatedBy")
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("datetime2");

                    b.Property<int>("DataStatus")
                        .HasColumnType("int");

                    b.Property<string>("DoctorDiagnosis")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("DoctorUserId")
                        .HasColumnType("int");

                    b.Property<string>("PaitentComplaint")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("PatientUserId")
                        .HasColumnType("int");

                    b.Property<int?>("ProviderId")
                        .HasColumnType("int");

                    b.Property<int?>("ProviderLocationId")
                        .HasColumnType("int");

                    b.Property<int?>("ProvisionNumber")
                        .HasColumnType("int");

                    b.Property<int?>("Severity")
                        .HasColumnType("int");

                    b.HasKey("AutoId");

                    b.ToTable("PatientMedicalHistories");
                });

            modelBuilder.Entity("GuvenFuture.Entities.PatientMedicalHistoryDetail.PatientMedicalHistoryDetail", b =>
                {
                    b.Property<int>("AutoId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("AutoId"));

                    b.Property<int>("CreatedBy")
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("datetime2");

                    b.Property<int>("DataStatus")
                        .HasColumnType("int");

                    b.Property<string>("Description")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("DoctorUserId")
                        .HasColumnType("int");

                    b.Property<bool>("IsPrescription")
                        .HasColumnType("bit");

                    b.Property<int?>("MaterialId")
                        .HasColumnType("int");

                    b.Property<string>("MaterialUnitName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("PatientMedicalHistoryId")
                        .HasColumnType("int");

                    b.Property<int?>("PatientUserId")
                        .HasColumnType("int");

                    b.Property<string>("PrescriptionNumber")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("ProviderId")
                        .HasColumnType("int");

                    b.Property<int?>("ProviderLocationId")
                        .HasColumnType("int");

                    b.Property<float?>("Quantity")
                        .HasColumnType("real");

                    b.Property<int?>("UsegeDose")
                        .HasColumnType("int");

                    b.HasKey("AutoId");

                    b.ToTable("PatientMedicalHistoryDetails");
                });

            modelBuilder.Entity("GuvenFuture.Entities.Provider.Provider", b =>
                {
                    b.Property<int>("AutoId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("AutoId"));

                    b.Property<string>("Address")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("CreatedBy")
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("datetime2");

                    b.Property<int>("DataStatus")
                        .HasColumnType("int");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("ProviderId")
                        .HasColumnType("int");

                    b.Property<string>("TesisKodu")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("AutoId");

                    b.ToTable("Providers");
                });

            modelBuilder.Entity("GuvenFuture.Entities.ProviderLocation.ProviderLocation", b =>
                {
                    b.Property<int>("AutoId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("AutoId"));

                    b.Property<int>("CreatedBy")
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("datetime2");

                    b.Property<int>("DataStatus")
                        .HasColumnType("int");

                    b.Property<string>("LocationNo")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("ParentId")
                        .HasColumnType("int");

                    b.Property<int?>("ProviderId")
                        .HasColumnType("int");

                    b.Property<int?>("UserId")
                        .HasColumnType("int");

                    b.HasKey("AutoId");

                    b.ToTable("ProviderLocations");
                });

            modelBuilder.Entity("GuvenFuture.Entities.User.User", b =>
                {
                    b.Property<int>("AutoId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("AutoId"));

                    b.Property<int>("CreatedBy")
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("datetime2");

                    b.Property<int>("DataStatus")
                        .HasColumnType("int");

                    b.Property<string>("FullName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("PasswordHashKey")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("PasswordHashed")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("ProviderId")
                        .HasColumnType("int");

                    b.Property<string>("TCNo")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("UserType")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("AutoId");

                    b.ToTable("Users");
                });

            modelBuilder.Entity("GuvenFuture.Entities.UserDetail.UserDetail", b =>
                {
                    b.Property<int>("AutoId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("AutoId"));

                    b.Property<string>("Address")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("BloodType")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("City")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Country")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("CreatedBy")
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("datetime2");

                    b.Property<int>("DataStatus")
                        .HasColumnType("int");

                    b.Property<string>("EMail")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Gender")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("Height")
                        .HasColumnType("int");

                    b.Property<string>("Nation")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("PhoneNumber")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("ProviderId")
                        .HasColumnType("int");

                    b.Property<int?>("UserId")
                        .HasColumnType("int");

                    b.Property<float?>("Weight")
                        .HasColumnType("real");

                    b.HasKey("AutoId");

                    b.ToTable("UserDetails");
                });

            modelBuilder.Entity("GuvenFuture.Entities.ViewModels.MedicalHistoryView", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Barcode")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("DoctorId")
                        .HasColumnType("int");

                    b.Property<string>("DoktorAdi")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("DoktorTC")
                        .HasColumnType("nvarchar(max)");

                    b.Property<double?>("Fiyat")
                        .HasColumnType("float");

                    b.Property<string>("HastaAdi")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("HastaKritikSeviyesi")
                        .HasColumnType("int");

                    b.Property<string>("HastaSikayeti")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("HastaTC")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("IslemKaydiniYapan")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime?>("IslemKayitTarihi")
                        .HasColumnType("datetime2");

                    b.Property<string>("IslemKayitTuru")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("KullanimDozu")
                        .HasColumnType("int");

                    b.Property<string>("MalzemeAdi")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("MalzemeBirimi")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("MalzemeTuru")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("MuayeneOdaNo")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("MuayeneYeri")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("ParaBirimi")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("PatientId")
                        .HasColumnType("int");

                    b.Property<int>("ProviderID")
                        .HasColumnType("int");

                    b.Property<int>("ProviderLocationId")
                        .HasColumnType("int");

                    b.Property<int?>("ProvisionNumber")
                        .HasColumnType("int");

                    b.Property<DateTime?>("RandevuBaslamaSaati")
                        .HasColumnType("datetime2");

                    b.Property<DateTime?>("RandevuBitisSaati")
                        .HasColumnType("datetime2");

                    b.Property<int?>("RandevuDurumu")
                        .HasColumnType("int");

                    b.Property<string>("RandevuKaydiniYapan")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("RandevuNotu")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime?>("RandevuTarihi")
                        .HasColumnType("datetime2");

                    b.Property<string>("ReceteNumarasi")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("SUTCode")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("SaglikKurulusu")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("SaglikKurulusuTesisKodu")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Teshis")
                        .HasColumnType("nvarchar(max)");

                    b.Property<double?>("VerilenMiktar")
                        .HasColumnType("float");

                    b.Property<string>("ZiyaretKayidiniYapan")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime?>("ZiyaretKayitTarihi")
                        .HasColumnType("datetime2");

                    b.Property<string>("ZiyaretKayitTuru")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime?>("ZiyaretTarihi")
                        .HasColumnType("datetime2");

                    b.HasKey("Id");

                    b.ToTable("MedicalHistoryView", (string)null);
                });
#pragma warning restore 612, 618
        }
    }
}
