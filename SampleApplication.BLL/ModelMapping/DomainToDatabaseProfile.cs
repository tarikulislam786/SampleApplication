using AutoMapper;
using SampleApplication.BLL.Models;
using SampleApplication.DAL.Database;

namespace SampleApplication.BLL.ModelMapping
{
    public partial class DomainToDatabaseProfile : Profile
    {
        protected override void Configure()
        {
            CreateMap<UserTypeModel, UserType>();
            CreateMap<RoleModel, Role>();
        }
    }
}


