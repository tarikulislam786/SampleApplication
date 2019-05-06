using AutoMapper;
using SampleApplication.BLL.Models;
using SampleApplication.DAL.Database;

namespace SampleApplication.BLL.ModelMapping
{
    public partial class DatabaseToDomainProfile : Profile
    {
        protected override void Configure()
        {
            CreateMap<UserType, UserTypeModel>();
            CreateMap<Role, RoleModel>();
        }
    }
}

