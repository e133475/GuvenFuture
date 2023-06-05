using GuvenFuture.Core.Models;
using GuvenFuture.DataAccess.Context;
using GuvenFuture.DataAccess.Core;
using GuvenFuture.Entities.AppointmentReminderQueue;
using GuvenFuture.Entities.Computeds.Enums;
using Microsoft.EntityFrameworkCore;

namespace GuvenFuture.DataAccess.AppointmentActions
{
    public partial class AppointmentActionOperations : DataAccessOperations<GuvenFuture.Entities.AppointmentActions.AppointmentAction>
    {
        public AppointmentActionOperations(DbContext context) : base(context)
        {

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="providerId"></param>
        /// <param name="locationId"></param>
        /// <param name="patientId"></param>
        /// <param name="selectedDate">Randevu Tarihi</param>
        /// <param name="reminderTimePeriod">Hatırlatma Periyodu</param>
        /// <param name="reminderCount">Hatırlatma Sayısı</param>
        /// <param name="reminderType">SMS, Email</param>
        /// <param name="appNote">Randevu Notu</param>
        /// Randevu saatinden önce hatırlatma sayısı kadar Hatırlatma Periyodlarınca Queue tablosuna hatırlatıcı kayıt atılır.
        /// <returns></returns>
        public async Task<ResultModel<bool>> CreateAppointmentAsync(int providerId, int locationId, int patientId, int userId, DateTime selectedDate, int reminderTimePeriod, int reminderCount, string reminderType, string appNote)
        {
            ResultModel<bool> result = new();
            try
            {
                //t1.EndDate > t2.StartDate AND t1.StartDate < t2.StartDate

                Entities.AppointmentActions.AppointmentAction isExists = base.GetAll(x => x.ProviderId == providerId
                && x.ProviderLocationId == locationId
                && x.AppointmentDate == selectedDate)?.FirstOrDefault();

                if (isExists != null)
                    throw new Exception("Belirtmiş olduğunuz saate kayıt mevcuttur.");
                else
                {
                    GuvenFutureContext context = ((GuvenFutureContext)_context);

                    Entities.AppointmentActions.AppointmentAction insertRow = new();
                    insertRow.ProviderId = providerId;
                    insertRow.AppointmentDate = selectedDate;
                    insertRow.ProviderLocationId = locationId;
                    insertRow.StartTime = selectedDate;
                    insertRow.EndTime = selectedDate;
                    insertRow.PatientUserId = patientId;
                    insertRow.DoctorUserId = context.ProviderLocations
                        .FirstOrDefault(x => x.AutoId == locationId)?.UserId;
                    insertRow.ReminderTimePeriod = reminderTimePeriod;
                    insertRow.ReminderCount = reminderCount;
                    insertRow.ReminderType = reminderType;
                    insertRow.AppointmentStatus = (int)EAppointmentStatuses.AcikRandevu;//Açık Randevu
                    insertRow.AppointmentStatusNote = appNote;
                    insertRow.CreatedBy = userId;
                    insertRow.CreatedDate = DateTime.Now;

                    int insertedId = await base.InsertAsync(insertRow);
                    if (insertedId > 0)
                    {
                        AppointmentReminderQueue.AppointmentReminderQueueOperations queOp = new(context);
                        for (int i = 0; i < reminderCount; i++)
                        {
                            Entities.AppointmentReminderQueue.AppointmentReminderQueue queue = new();
                            queue.ProviderId = providerId;
                            queue.ReminderType = reminderType;
                            queue.AppointmentActionId = insertedId;
                            queue.ReminderDate = selectedDate.AddMinutes(-i * reminderTimePeriod);//  DateTime.Now;   
                            queue.CreatedDate = DateTime.Now;
                            queue.CreatedBy = userId;
                            queue.ReminderStatus = 1;

                            int queueId = await queOp.InsertAsync(queue);
                        }

                        result.IsSucces = true;
                        result.Message = "Randevunuz başarıyla oluştu.";
                    }
                    else
                        throw new Exception("Randevu kayıt işlemi sırasında bir problem oluştu.");
                }
            }
            catch (Exception ex)
            {
                result.IsSucces = false;
                result.Message = ex.Message;
            }

            return result;
        }
    }
}
