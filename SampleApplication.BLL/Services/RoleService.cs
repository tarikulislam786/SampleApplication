using AutoMapper;
using SampleApplication.BLL.Models;
using SampleApplication.BLL.Resources;
using SampleApplication.BLL.Responses;
using SampleApplication.DAL.Database;
using SampleApplication.Utils.Infrastructure;
using SampleApplication.Utils.Infrastructure.Contract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SampleApplication.DAL.Repositories;
namespace SampleApplication.BLL.Services
{
    public partial interface IRoleService : IBaseService<RoleModel, Role>
    {
        IList<RoleModel> GetAllRoleList();
        RoleModel GetUserRole(string roleId);
        BaseResponse InsertUserRole(RoleModel role);
        BaseResponse UpdateUserRole(RoleModel role);
        BaseResponse DeleteUserRole(string roleId);
    }
    public class RoleService : BaseService<RoleModel, Role>, IRoleService
    {
        private readonly IRoleRepository _roleRepository;

        public RoleService(IRoleRepository roleRepository)
            : base(roleRepository)
        {
            _roleRepository = roleRepository;
        }

        
        public IList<RoleModel> GetAllRoleList()
        {
            var roleList = _roleRepository.GetAllRoleList();
            return Mapper.Map<List<Role>, List<RoleModel>>(roleList);
        }

        public BaseResponse DeleteUserRole(string roleId)
        {
            var validationResult = ValidateRoleForDelete(roleId);
            if (validationResult.Key)
            {
                _roleRepository.DeleteSoftly(validationResult.Value);
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

        private KeyValuePair<bool, string> ValidateRoleForDelete(string roleId)
        {
            if (string.IsNullOrWhiteSpace(roleId))
            {
                return new KeyValuePair<bool, string>(false, CustomMessage.InvalidId);
            }
            if (roleId.Length != 2)
            {
                return new KeyValuePair<bool, string>(false, CustomMessage.InvalidId);
            }
            var role = _roleRepository.GetUserRole(roleId);
            if (role == null)
            {
                return new KeyValuePair<bool, string>(false, CustomMessage.NotFound);
            }
            return new KeyValuePair<bool, string>(true, role.Id);
        }

        

        public RoleModel GetUserRole(string roleId)
        {
            var role = _roleRepository.GetUserRole(roleId);
            return Mapper.Map<Role, RoleModel>(role);
        }

        public BaseResponse InsertUserRole(RoleModel role)
        {
            var validationResult = ValidateRoleForInsert(role);
            if (validationResult.Key)
            {
                role.Id = _roleRepository.GetNextUserRoleId();
                var result = _roleRepository.InsertUserRole(Mapper.Map<RoleModel, Role>(role));
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

        private KeyValuePair<bool, string> ValidateRoleForInsert(RoleModel role)
        {
            if (role == null)
            {
                return new KeyValuePair<bool, string>(false, CustomMessage.IncorrectInformation);
            }
            if (string.IsNullOrWhiteSpace(role.Name))
            {
                return new KeyValuePair<bool, string>(false, CustomMessage.InvalidUserRoleName);
            }
            return new KeyValuePair<bool, string>(true, CustomMessage.Ok);
        }
        public BaseResponse UpdateUserRole(RoleModel role)
        {
            var validationResult = ValidateRoleforUpdate(role);
            if (validationResult.Key)
            {
                var result = _roleRepository.UpdateUserRole(Mapper.Map<RoleModel, Role>(role));
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

        private KeyValuePair<bool, string> ValidateRoleforUpdate(RoleModel role)
        {
            if (role == null)
            {
                return new KeyValuePair<bool, string>(false, CustomMessage.IncorrectInformation);
            }
            if (string.IsNullOrWhiteSpace(role.Id))
            {
                return new KeyValuePair<bool, string>(false, CustomMessage.InvalidId);
            }
            if (string.IsNullOrWhiteSpace(role.Name))
            {
                return new KeyValuePair<bool, string>(false, CustomMessage.InvalidUserRoleName);
            }
            return new KeyValuePair<bool, string>(true, CustomMessage.Ok);
        }

    }
}
