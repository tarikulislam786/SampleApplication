using System;
using SampleApplication.Utils.Infrastructure.Contract;

namespace SampleApplication.Utils.Infrastructure
{
    [Serializable]
    public abstract class BaseDomainModel<T> : IBaseDomainModel where T : BaseDomainModel<T>
    {
        public string Id { get; set; }
        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime SetOn { get; set; }
        public long SetBy { get; set; }
        public string SetFrom { get; set; }
        public string Note { get; set; }

        public BaseDomainModel()
        {
            InitializeModel();
        }

        public void SetCreateProperties(long userId)
        {
            //SetOn = DateTime.UtcNow;
            //SetBy = userId;
        }

        public void SetUpdateProperties(long userId)
        {
            //ModifiedOn = DateTime.UtcNow;
            //ModifiedBy = userId;
        }

        //public void MarkAsDeleted(long userId)
        //{
        //    IsDeleted = true;
        //}

        //public void SetProperties()
        //{
        //    //CustomUserPrincipal principal = Thread.CurrentPrincipal as CustomUserPrincipal;
        //    IsDeleted = false;
        //    CreatedOn = DateTime.UtcNow;
        //    ModifiedOn = DateTime.UtcNow;
        //    //if (principal != null)
        //    //{
        //    //    CreatedBy = principal.PersonId;
        //    //    ModifiedBy = principal.PersonId;
        //    //}
        //}

        private void InitializeModel()
        {
            IsActive = true;
            IsDeleted = false;
            SetOn = DateTime.UtcNow;
            //SetBy = 0;
        }
    }

    //public class filter
    //{
    //    public string field { get; set; }
    //    public string Operator { get; set; }
    //    public string value { get; set; }
    //    public string logic { get; set; }
    //}
}