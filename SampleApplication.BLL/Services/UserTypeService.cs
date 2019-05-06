using System.Collections.Generic;
using AutoMapper;
using SampleApplication.Utils.Infrastructure;
using SampleApplication.Utils.Infrastructure.Contract;
using SampleApplication.BLL.Models;
using SampleApplication.BLL.Resources;
using SampleApplication.BLL.Responses;
using SampleApplication.DAL.Database;
using SampleApplication.DAL.Repositories;

namespace SampleApplication.BLL.Services
{
    public partial interface IUserTypeService : IBaseService<UserTypeModel, UserType>
    {
        IList<UserTypeModel> GetAllUserTypeList();
        UserTypeModel GetUserType(string userTypeId);
        BaseResponse InsertUserType(UserTypeModel userType);
        BaseResponse UpdateUserType(UserTypeModel userType);
        BaseResponse DeleteUserType(string userTypeId);
    }

    public class UserTypeService : BaseService<UserTypeModel, UserType>, IUserTypeService
    {
        private readonly IUserTypeRepository _userTypeRepository;
        public UserTypeService(IUserTypeRepository userTypeRepository)
            : base(userTypeRepository)
        {
            _userTypeRepository = userTypeRepository;
        }

        public IList<UserTypeModel> GetAllUserTypeList()
        {
            var userTypeList = _userTypeRepository.GetAllUserTypeList();
            return Mapper.Map<List<UserType>, List<UserTypeModel>>(userTypeList);
        }

        public UserTypeModel GetUserType(string userTypeId)
        {
            var userType = _userTypeRepository.GetUserType(userTypeId);
            return Mapper.Map<UserType, UserTypeModel>(userType);
        }

        public BaseResponse InsertUserType(UserTypeModel userType)
        {
            var validationResult = ValidateUserTypeForInsert(userType);
            if (validationResult.Key)
            {
                userType.Id = _userTypeRepository.GetNextUserTypeId();
                var result = _userTypeRepository.InsertUserType(Mapper.Map<UserTypeModel, UserType>(userType));
                return new BaseResponse
                {
                    IsOperationSuccessful = true,
                    Message = CustomMessage.SavedSuccess
                };
            }
            return new BaseResponse
            {
                IsOperationSuccessful = false,
                Message = validationResult.Value
            };
        }

        private KeyValuePair<bool, string> ValidateUserTypeForInsert(UserTypeModel userType)
        {
            if (userType == null)
            {
                return new KeyValuePair<bool, string>(false, CustomMessage.IncorrectInformation);
            }
            if (string.IsNullOrWhiteSpace(userType.Name))
            {
                return new KeyValuePair<bool, string>(false, CustomMessage.InvalidUserTypeName);
            }
            return new KeyValuePair<bool, string>(true, CustomMessage.Ok);
        }

        public BaseResponse UpdateUserType(UserTypeModel userType)
        {
            var validationResult = ValidateUserTypeforUpdate(userType);
            if (validationResult.Key)
            {
                var result = _userTypeRepository.UpdateUserType(Mapper.Map<UserTypeModel, UserType>(userType));
                return new BaseResponse
                {
                    IsOperationSuccessful = true,
                    Message = CustomMessage.SavedSuccess
                };
            }
            return new BaseResponse
            {
                IsOperationSuccessful = false,
                Message = validationResult.Value
            };
        }

        private KeyValuePair<bool, string> ValidateUserTypeforUpdate(UserTypeModel userType)
        {
            if (userType == null)
            {
                return new KeyValuePair<bool, string>(false, CustomMessage.IncorrectInformation);
            }
            if (string.IsNullOrWhiteSpace(userType.Id))
            {
                return new KeyValuePair<bool, string>(false, CustomMessage.InvalidId);
            }
            if (string.IsNullOrWhiteSpace(userType.Name))
            {
                return new KeyValuePair<bool, string>(false, CustomMessage.InvalidUserTypeName);
            }
            return new KeyValuePair<bool, string>(true, CustomMessage.Ok);
        }

        public BaseResponse DeleteUserType(string userTypeId)
        {
            var validationResult = ValidateUserTypeForDelete(userTypeId);
            if (validationResult.Key)
            {
                _userTypeRepository.DeleteSoftly(validationResult.Value);
                return new BaseResponse
                {
                    IsOperationSuccessful = true,
                    Message = CustomMessage.DeleteSuccess
                };
            }
            return new BaseResponse
            {
                IsOperationSuccessful = false,
                Message = validationResult.Value
            };
        }

        private KeyValuePair<bool, string> ValidateUserTypeForDelete(string userTypeId)
        {
            if (string.IsNullOrWhiteSpace(userTypeId))
            {
                return new KeyValuePair<bool, string>(false, CustomMessage.InvalidId);
            }
            if (userTypeId.Length != 2)
            {
                return new KeyValuePair<bool, string>(false, CustomMessage.InvalidId);
            }
            var userType = _userTypeRepository.GetUserType(userTypeId);
            if (userType == null)
            {
                return new KeyValuePair<bool, string>(false, CustomMessage.NotFound);
            }
            return new KeyValuePair<bool, string>(true, userType.Id);
        }
    }
}
