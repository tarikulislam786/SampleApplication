using SampleApplication.Utils.Infrastructure;

namespace SampleApplication.BLL.Models
{
    public class UserTypeModel : BaseDomainModel<UserTypeModel>
    {
        public string Name { get; set; }
        public string Description { get; set; }
    }
}
