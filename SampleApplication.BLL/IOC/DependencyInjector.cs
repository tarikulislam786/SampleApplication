using SampleApplication.Utils.Infrastructure;
using SampleApplication.Utils.Infrastructure.Contract;
using Microsoft.Practices.Unity;
using SampleApplication.BLL.Services;
using SampleApplication.DAL.Repositories;

namespace SampleApplication.BLL.IOC
{
    public partial class DependencyInjector
    {
        public static void Inject(UnityContainer container)
        {
            container.RegisterType<IUnitOfWork, UnitOfWork>();
            container.RegisterType<IUserTypeRepository, UserTypeRepository>();
            container.RegisterType<IUserTypeService, UserTypeService>();
            container.RegisterType<IRoleRepository, RoleRepository>();
            container.RegisterType<IRoleService, RoleService>();
        }
    }
}

