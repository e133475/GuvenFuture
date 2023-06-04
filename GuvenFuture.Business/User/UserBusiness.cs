using GuvenFuture.Business.Core;
using GuvenFuture.Core.Models;
using GuvenFuture.DataAccess.Context;
using GuvenFuture.DataAccess.User;
using SystemManager.Core.Helper;

namespace GuvenFuture.Business.User
{
    public class UserBusiness : BusinessCommonOperations<Entities.User.User>
    {
        #region For Custom Operations
        readonly UserOperations _modelOp;
        public UserBusiness(GuvenFutureContext context) : base(context)
        {
            _modelOp = new UserOperations(context);
        }
        #endregion

        #region Custom Operations
        public async Task<ResultModel<Entities.User.User>> Login(string tcNo, string password)
        {
            ResultModel<Entities.User.User> result = new();
            try
            {
                if (string.IsNullOrEmpty(tcNo) || string.IsNullOrEmpty(password))
                    throw new Exception("TC No ya da şifre boş olamaz.");

                Entities.User.User userData = await _modelOp.GetFirstOrDefaultAsync(x => x.TCNo == tcNo);
                if (userData == null)
                    throw new Exception("Hesap bulunamadı.");

                SecurePasswordHasher securePasswordHasher = new();
                securePasswordHasher.UserSalt = userData.PasswordHashKey;
                bool isHashSuccess = securePasswordHasher.Verify(password, userData.PasswordHashed);

                if (!isHashSuccess)
                    throw new Exception("Kullanıcı doğrulanamadı.");
                else
                    result.ResultData = userData;

                result.IsSucces = true;
                result.Message = "Giriş İşlemi başarılı.";
            }
            catch (Exception ex)
            {
                result.IsSucces = false;
                result.Message = ex.Message;
            }

            return result;
        }
        public async Task<ResultModel<bool>> Register(Entities.Computeds.DTOs.UserAuthModel userDto)
        {
            ResultModel<bool> result = new();
            try
            {
                Entities.User.User userData = new();
                userData.TCNo = userDto.TCNo;

                Entities.User.User userExists = await _modelOp.GetFirstOrDefaultAsync(x => x.TCNo == userData.TCNo);
                if (userExists != null)
                    throw new Exception("Hesap daha önceden oluşturulmuş.");

                SecurePasswordHasher securePasswordHasher = new();
                userData.PasswordHashed = securePasswordHasher.Hash(userDto.PassWord);
                userData.PasswordHashKey = securePasswordHasher.UserSalt;

                int insertedId = _modelOp.Insert(userData);

                if (insertedId == -1)
                    throw new Exception("Kullanıcı kayıt edilemedi.");
                else
                    result.ResultData = true;

                result.IsSucces = true;
                result.Message = "Kayıt İşlemi başarılı.";
            }
            catch (Exception ex)
            {
                result.IsSucces = false;
                result.Message = ex.Message;
            }

            return result;
        }

        #endregion
    }
}