using SampleApplication.Utils.Infrastructure.Contract;
using Ninject.Modules;

namespace SampleApplication.Utils.Infrastructure.IOC
{
    public class CommonModule : NinjectModule
    {
        public override void Load()
        {
            Bind<IUnitOfWork>().To<UnitOfWork>();
            Bind<IConnectionStringProvider>().To<ConnectionStringProvider>();
        }
    }
}
