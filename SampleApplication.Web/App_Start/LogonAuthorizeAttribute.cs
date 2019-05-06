using System.Web.Mvc;

namespace SampleApplication.Web
{
    public class LogonAuthorizeAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (filterContext.HttpContext.Session != null)
            {
                var user = filterContext.HttpContext.Session["LoginInformation"];
                if (user == null)
                    if (filterContext.HttpContext.Request.Url != null)
                    {
                        filterContext.Result = new RedirectResult($"/Account/Login?targetUrl={filterContext.HttpContext.Request.Url.AbsolutePath}");
                    }
            }
        }
    }
}