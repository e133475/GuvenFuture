using GuvenFuture.Core.Models;
using GuvenFuture.Entities.AppointmentActions;
using Microsoft.EntityFrameworkCore;

namespace GuvenFuture.DataAccess.Context
{
    public class GuvenFutureContext : DbContext
    {
        public GuvenFutureContext(DbContextOptions<GuvenFutureContext> dbContextOptions) : base(dbContextOptions)
        {
            Database.Migrate();
        }

        void SetQueryFilter<TEntity>(ModelBuilder modelBuilder)  where TEntity : BaseEntity
        {
            modelBuilder.Entity<TEntity>().HasQueryFilter(e => e.DataStatus == 1);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            var setQueryFilterMethod = new Action<ModelBuilder>(SetQueryFilter<BaseEntity>)
                .Method.GetGenericMethodDefinition();
            foreach (var entityType in modelBuilder.Model.GetEntityTypes())
            {
                if (entityType.BaseType == null && typeof(BaseEntity).IsAssignableFrom(entityType.ClrType))
                {
                    setQueryFilterMethod
                        .MakeGenericMethod(entityType.ClrType)
                        .Invoke(this, new object[] { modelBuilder });
                }
            }
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {

        }

        public virtual DbSet<Entities.Provider.Provider> Providers { get; set; }
        public virtual DbSet<Entities.User.User> Users { get; set; }
        public virtual DbSet<Entities.UserDetail.UserDetail> UserDetails { get; set; }
        public virtual DbSet<Entities.ProviderLocation.ProviderLocation> ProviderLocations { get; set; }
        public virtual DbSet<Entities.AppointmentSetting.AppointmentSetting> AppointmentSettings { get; set; }
        public virtual DbSet<AppointmentAction> AppointmentActions { get; set; }
        public virtual DbSet<Entities.AppointmentReminderQueue.AppointmentReminderQueue> AppointmentReminderQueues { get; set; }
        public virtual DbSet<Entities.PatientMedicalHistory.PatientMedicalHistory> PatientMedicalHistories { get; set; }
        public virtual DbSet<Entities.PatientMedicalHistoryDetail.PatientMedicalHistoryDetail> PatientMedicalHistoryDetails { get; set; }
        public virtual DbSet<Entities.Material.Material> Materials { get; set; }
    }
}
