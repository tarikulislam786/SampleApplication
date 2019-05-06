using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using SampleApplication.BLL.Models;
using SampleApplication.BLL.Responses;
using SampleApplication.BLL.Services;

namespace SampleApplication.Web.Controllers
{
    public class ApiAdminController : ApiController
    {
        public readonly IUserTypeService _userTypeService;
        
        public readonly IRoleService _roleService;

        public ApiAdminController(IUserTypeService userTypeService, IRoleService roleService)
        {
            _userTypeService = userTypeService;
            _roleService = roleService;
        }

        #region UserType

        [HttpGet]
        public List<UserTypeModel> UserTypeList()
        {
            return _userTypeService.GetAllUserTypeList().ToList();
        }

        [HttpGet]
        public UserTypeModel UserTypeDetails(string id)
        {
            return _userTypeService.GetUserType(id);
        }

        [HttpPost]
        public BaseResponse CreateUserType(UserTypeModel userType)
        {
            return _userTypeService.InsertUserType(userType);
        }

        [HttpPost]
        public BaseResponse UpdateUserType(UserTypeModel userType)
        {
            return _userTypeService.UpdateUserType(userType);
        }

        #endregion

        #region UserRole

        [HttpGet]
        public List<RoleModel> UserRoleList()
        {
            return _roleService.GetAllRoleList().ToList();
        }

        [HttpGet]
        public RoleModel UserRoleDetails(string id)
        {
            return _roleService.GetUserRole(id);
        }

        [HttpPost]
        public BaseResponse CreateUserRole(RoleModel role)
        {
            return _roleService.InsertUserRole(role);
        }

        [HttpPost]
        public BaseResponse UpdateUserRole(RoleModel role)
        {
            return _roleService.UpdateUserRole(role);
        }

        #endregion 
    }
}
