using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace RAMS
{
    public partial class roomSelection : System.Web.UI.Page
    {
        private string vssConnStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\lagar\Desktop\RAMS\App_Data\VSS.mdf;Integrated Security=True;MultipleActiveResultSets=true";
        private string ramsConnStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\lagar\Desktop\RAMS\App_Data\System_DB.mdf;Integrated Security=True;MultipleActiveResultSets=true";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    }
}