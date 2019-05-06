using AutoMapper;

namespace SampleApplication.BLL.ModelMapping 
{
	public partial class AutoMapperBootStrapper
	{
		public static void Initialize()
        {
            Mapper.AddProfile(new DatabaseToDomainProfile());
            Mapper.AddProfile(new DomainToDatabaseProfile());
        }
	}
}

