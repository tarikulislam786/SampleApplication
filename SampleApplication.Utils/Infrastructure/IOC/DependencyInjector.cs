﻿using SampleApplication.Utils.Infrastructure.Contract;
using Ninject;

namespace SampleApplication.Utils.Infrastructure.IOC
{
    public class DependencyInjector : IDependencyInjector
    {
        public void Inject(object container)
        {
            var kernel = container as IKernel;
            kernel.Load<CommonModule>();
         }
    }
}
