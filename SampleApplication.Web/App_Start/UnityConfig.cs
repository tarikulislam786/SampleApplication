using Microsoft.Practices.Unity;
using System.Web.Http;
using Unity.WebApi;
using System.Web.Mvc;
using SampleApplication.BLL.IOC;

namespace SampleApplication.Web
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
			var container = new UnityContainer();
            
            // register all your components with the container here
            // it is NOT necessary to register your controllers
            
            // e.g. container.RegisterType<ITestService, TestService>();
            
            //GlobalConfiguration.Configuration.DependencyResolver = new UnityDependencyResolver(container);

            DependencyInjector.Inject(container);
            GlobalConfiguration.Configuration.DependencyResolver = new UnityDependencyResolver(container);
            DependencyResolver.SetResolver(new Unity.Mvc5.UnityDependencyResolver(container));
        }
    }
}