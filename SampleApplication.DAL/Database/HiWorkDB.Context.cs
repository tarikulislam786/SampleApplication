﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SampleApplication.DAL.Database
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class HiWorkDB : DbContext
    {
        public HiWorkDB()
            : base("name=HiWorkDB")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AccessLog> AccessLogs { get; set; }
        public virtual DbSet<AdditionalOperationPermission> AdditionalOperationPermissions { get; set; }
        public virtual DbSet<AdditionalScreenPermission> AdditionalScreenPermissions { get; set; }
        public virtual DbSet<Application> Applications { get; set; }
        public virtual DbSet<ApplicationPolicy> ApplicationPolicies { get; set; }
        public virtual DbSet<Menu> Menus { get; set; }
        public virtual DbSet<Module> Modules { get; set; }
        public virtual DbSet<Person> People { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<RoleAudit> RoleAudits { get; set; }
        public virtual DbSet<RoleWiseOperationPermission> RoleWiseOperationPermissions { get; set; }
        public virtual DbSet<RoleWiseScreenPermission> RoleWiseScreenPermissions { get; set; }
        public virtual DbSet<Screen> Screens { get; set; }
        public virtual DbSet<ScreenOperation> ScreenOperations { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<UserInformation> UserInformations { get; set; }
        public virtual DbSet<UserInRole> UserInRoles { get; set; }
        public virtual DbSet<UserType> UserTypes { get; set; }
        public virtual DbSet<IdentityInformation> IdentityInformations { get; set; }
    
        public virtual int sp_alterdiagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_alterdiagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_creatediagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_creatediagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_dropdiagram(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_dropdiagram", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagramdefinition_Result> sp_helpdiagramdefinition(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagramdefinition_Result>("sp_helpdiagramdefinition", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagrams_Result> sp_helpdiagrams(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagrams_Result>("sp_helpdiagrams", diagramnameParameter, owner_idParameter);
        }
    
        public virtual int sp_renamediagram(string diagramname, Nullable<int> owner_id, string new_diagramname)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var new_diagramnameParameter = new_diagramname != null ?
                new ObjectParameter("new_diagramname", new_diagramname) :
                new ObjectParameter("new_diagramname", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_renamediagram", diagramnameParameter, owner_idParameter, new_diagramnameParameter);
        }
    
        public virtual int sp_upgraddiagrams()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_upgraddiagrams");
        }
    
        public virtual int USP_GetAdditionalOperationPermissionList(Nullable<long> id, Nullable<long> userId, Nullable<long> screenOperationId)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("Id", id) :
                new ObjectParameter("Id", typeof(long));
    
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(long));
    
            var screenOperationIdParameter = screenOperationId.HasValue ?
                new ObjectParameter("ScreenOperationId", screenOperationId) :
                new ObjectParameter("ScreenOperationId", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("USP_GetAdditionalOperationPermissionList", idParameter, userIdParameter, screenOperationIdParameter);
        }
    
        public virtual int USP_GetAdditionalScreenPermissionList(Nullable<long> id, Nullable<long> userId, Nullable<long> moduleId, Nullable<long> screenId)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("Id", id) :
                new ObjectParameter("Id", typeof(long));
    
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(long));
    
            var moduleIdParameter = moduleId.HasValue ?
                new ObjectParameter("ModuleId", moduleId) :
                new ObjectParameter("ModuleId", typeof(long));
    
            var screenIdParameter = screenId.HasValue ?
                new ObjectParameter("ScreenId", screenId) :
                new ObjectParameter("ScreenId", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("USP_GetAdditionalScreenPermissionList", idParameter, userIdParameter, moduleIdParameter, screenIdParameter);
        }
    
        public virtual int USP_GetRoleWiseOperationPermissionList(Nullable<long> id, Nullable<long> roleId, Nullable<long> screenOperationId)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("Id", id) :
                new ObjectParameter("Id", typeof(long));
    
            var roleIdParameter = roleId.HasValue ?
                new ObjectParameter("RoleId", roleId) :
                new ObjectParameter("RoleId", typeof(long));
    
            var screenOperationIdParameter = screenOperationId.HasValue ?
                new ObjectParameter("ScreenOperationId", screenOperationId) :
                new ObjectParameter("ScreenOperationId", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("USP_GetRoleWiseOperationPermissionList", idParameter, roleIdParameter, screenOperationIdParameter);
        }
    
        public virtual int USP_GetRoleWiseScreenPermissionList(Nullable<long> id, Nullable<long> roleId, Nullable<long> moduleId, Nullable<long> screenId)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("Id", id) :
                new ObjectParameter("Id", typeof(long));
    
            var roleIdParameter = roleId.HasValue ?
                new ObjectParameter("RoleId", roleId) :
                new ObjectParameter("RoleId", typeof(long));
    
            var moduleIdParameter = moduleId.HasValue ?
                new ObjectParameter("ModuleId", moduleId) :
                new ObjectParameter("ModuleId", typeof(long));
    
            var screenIdParameter = screenId.HasValue ?
                new ObjectParameter("ScreenId", screenId) :
                new ObjectParameter("ScreenId", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("USP_GetRoleWiseScreenPermissionList", idParameter, roleIdParameter, moduleIdParameter, screenIdParameter);
        }
    
        public virtual int USP_GetScreenList(Nullable<long> id, Nullable<long> moduleId)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("Id", id) :
                new ObjectParameter("Id", typeof(long));
    
            var moduleIdParameter = moduleId.HasValue ?
                new ObjectParameter("ModuleId", moduleId) :
                new ObjectParameter("ModuleId", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("USP_GetScreenList", idParameter, moduleIdParameter);
        }
    
        public virtual int USP_GetScreenOperationList(Nullable<long> id, Nullable<long> screenId)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("Id", id) :
                new ObjectParameter("Id", typeof(long));
    
            var screenIdParameter = screenId.HasValue ?
                new ObjectParameter("ScreenId", screenId) :
                new ObjectParameter("ScreenId", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("USP_GetScreenOperationList", idParameter, screenIdParameter);
        }
    
        public virtual int USP_GetUserDetails(Nullable<long> id, string username)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("Id", id) :
                new ObjectParameter("Id", typeof(long));
    
            var usernameParameter = username != null ?
                new ObjectParameter("Username", username) :
                new ObjectParameter("Username", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("USP_GetUserDetails", idParameter, usernameParameter);
        }
    
        public virtual int USP_GetUsers()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("USP_GetUsers");
        }
    
        public virtual ObjectResult<USP_GetNextId_Result> USP_GetNextId(string identityField, string identityLengthField)
        {
            var identityFieldParameter = identityField != null ?
                new ObjectParameter("IdentityField", identityField) :
                new ObjectParameter("IdentityField", typeof(string));
    
            var identityLengthFieldParameter = identityLengthField != null ?
                new ObjectParameter("IdentityLengthField", identityLengthField) :
                new ObjectParameter("IdentityLengthField", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<USP_GetNextId_Result>("USP_GetNextId", identityFieldParameter, identityLengthFieldParameter);
        }
    }
}