using SampleApplication.Utils.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleApplication.BLL.Models
{

    public class RoleModel : BaseDomainModel<RoleModel>
    {
        public string Name { get; set; }
        public string Description { get; set; }
    }
}
