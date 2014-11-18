using Microsoft.SharePoint;
using Microsoft.SharePoint.Linq;
using System;
using System.ComponentModel;
using System.Web.UI.WebControls.WebParts;
namespace RotattingBanner.VisualWebPart1
{
    [ToolboxItemAttribute(false)]
    public partial class VisualWebPart1 : WebPart
    {
        // Uncomment the following SecurityPermission attribute only when doing Performance Profiling using
        // the Instrumentation method, and then remove the SecurityPermission attribute when the code is ready
        // for production. Because the SecurityPermission attribute bypasses the security check for callers of
        // your constructor, it's not recommended for production purposes.
        // [System.Security.Permissions.SecurityPermission(System.Security.Permissions.SecurityAction.Assert, UnmanagedCode = true)]
        public VisualWebPart1()
        {
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            InitializeControl();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!this.Page.IsPostBack)

            //    BindData();

        }

        //<OrderBy><FieldRef Name='Sort_x0020_Order' Ascending='TRUE'/></OrderBy>
        //private void BindData()
        //{

        //    SPSecurity.RunWithElevatedPrivileges(delegate()
        //    {
        //        using (SPSite site = new SPSite(SPContext.Current.Web.Url))
        //        {
        //            using (SPWeb web = site.RootWeb)
        //            {
        //                SPQuery query = new SPQuery();
        //                //  query.ViewFieldsOnly = true;
        //                query.Query = @"<OrderBy><FieldRef Name='Sort_x0020_Order' Ascending='TRUE'/></OrderBy><Where><Eq><FieldRef Name='Enabled' /><Value Type='Boolean'>1</Value></Eq></Where>";
        //                SPList list = web.Lists["Home Page Banner"];
        //                SPListItemCollection items = list.GetItems(query);
        //                Repeater1.DataSource = items.GetDataTable();
        //                Repeater1.DataBind();
        //            }
        //        }
        //    });
        //}
    }
}
