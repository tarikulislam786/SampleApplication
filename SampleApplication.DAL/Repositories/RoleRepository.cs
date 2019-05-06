using SampleApplication.DAL.Database;
using SampleApplication.Utils.Infrastructure;
using SampleApplication.Utils.Infrastructure.Contract;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleApplication.DAL.Repositories
{
    public partial interface IRoleRepository : IBaseRepository<Role>
    {
        string GetNextUserRoleId();
        List<Role> GetAllRoleList();
        Role GetUserRole(string roleId);
        Role InsertUserRole(Role role);
        Role UpdateUserRole(Role role);
        int DeleteUserRole(long role);
    }
    public class RoleRepository : BaseRepository<Role, HiWorkDB>, IRoleRepository
    {
        private readonly HiWorkDB _dbContext;

        public RoleRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
            _dbContext = new HiWorkDB();
        }


        public int DeleteUserRole(long role)
        {
            string query = "EXEC [dbo].[USP_DeleteUserRole] " + role + "";
            return _dbContext.Database.ExecuteSqlCommand(query);
        }

        public List<Role> GetAllRoleList()
        {
            return _dbContext.Roles.ToList();
        }

        public string GetNextUserRoleId()
        {
            var query = new StringBuilder();
            query.Append("EXEC [dbo].[USP_GetNextId] 'RoleId', 'RoleIdLength'");

            var finalQuery = query.ToString().Contains("''")
                ? query.ToString().Replace("''", "NULL")
                : query.ToString();
            var result = _dbContext.Database.SqlQuery<USP_GetNextId_Result>(finalQuery).FirstOrDefault();
            return result.Id;
        }

        public Role GetUserRole(string roleId)
        {
            return _dbContext.Roles.FirstOrDefault(u => u.Id == roleId);
        }

        public Role InsertUserRole(Role role)
        {
            var result = _dbContext.Roles.Add(role);
            try
            {
                _dbContext.SaveChanges();
            }
            catch (DbEntityValidationException ex)
            {
                foreach (var entityValidationErrors in ex.EntityValidationErrors)
                {
                    foreach (var validationError in entityValidationErrors.ValidationErrors)
                    {
                        Console.WriteLine("Property: " + validationError.PropertyName + " Error: " + validationError.ErrorMessage);
                    }
                }
            }
            return result;
        }

        public Role UpdateUserRole(Role role)
        {
            _dbContext.Entry(role).State = EntityState.Modified;
            _dbContext.SaveChanges();
            return role;
        }
    }
}
