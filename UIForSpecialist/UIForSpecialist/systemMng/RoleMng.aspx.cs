using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Xml.Linq;

namespace UIForSpecialist.systemMng
{
    public partial class RoleMng : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string get_content(string input)
        {
            string accountXmlPath = HttpContext.Current.ApplicationInstance.Server.MapPath("~/App_Data/") + "accountData.xml";
            string[] vars = input.Split(',');
            string clickname = vars[0];
            string attr = "empty";
            XElement root = XElement.Load(accountXmlPath);
            List<string[]> path = new List<string[]>();
            path.Add(new string[2] { "users", "user" });
            path.Add(new string[2] { "admins", "admin" });
            Dictionary<string, string> userInfo = new Dictionary<string, string>();

            for (int i = 1; i < vars.Length; i++)
            {
                attr = getNode(root, clickname, vars[i], path);
                userInfo.Add(vars[i], attr);
            }
            string rtdata = (new JavaScriptSerializer()).Serialize(userInfo);
            return rtdata;
        }

        public static string getNode(XElement root, string clickname, string wantname, List<string[]> path)
        {
            IEnumerable<XElement> nodes;
            string info = "inner empty";
            foreach (string[] pth in path)
            {
                nodes = root.Element(pth[0]).Elements(pth[1]);
                foreach (XElement node in nodes)
                {
                    if (node.Attribute("username").Value.ToString() == clickname)
                    {
                        info = node.Element(wantname).Value.ToString();
                    }
                }
            }
            return info;
        }
    }
}