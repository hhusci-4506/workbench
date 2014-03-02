using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;

namespace UIForSpecialist
{
    public partial class Index : System.Web.UI.Page
    {
        string accountXmlPath = HttpContext.Current.ApplicationInstance.Server.MapPath("~/App_Data/")+"accountData.xml";
        bool admit = false;

        protected void Page_Load(object sender, EventArgs e)
        {
        }
        
        protected void loginBtn_Click(object sender, EventArgs e)
        {
            
            //XmlDocument xmlDoc = load_xml(accountXmlPath);
            //runningThrough(xmlDoc.DocumentElement);
            List<string[]> nodenames = new List<string[]>();
            nodenames.Add(new string[2]{"users","user"});
            nodenames.Add(new string[2]{"admins","admin"});
            XElement root = XElement.Load(accountXmlPath);
            checkNode(root, nodenames);
            if (admit == true)
            {
                Response.Redirect("/About.aspx");
            }
            else
            {
                Response.Write("<script type='text/javascript'>alert('用户名或密码错误！！');</script>");
            }
        }

        protected void checkNode(XElement root, List<string[]> nodenames)
        {
            IEnumerable<XElement> nodes;
            foreach (string[] nodename in nodenames)
            {
                nodes = root.Element(nodename[0]).Elements(nodename[1]);
                foreach (XElement node in nodes)
                {
                    
                    if (node.Attribute("username").Value.ToString() == this.Request["username"])
                    {
                        if (node.Element("code").Value.ToString() == this.Request["code"])
                        {
                            
                            admit = true;
                            Session["role"] = node.Element("role").Value.ToString();
                            Session["username"] = node.Attribute("username").Value.ToString();
                        }
                    }
                }
            }

        }

        /*private XmlDocument load_xml(string filepath){
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(filepath);

            return xmlDoc;
        }

        protected void runningThrough(XmlNode nod)
        {
            node = nod;

            if (node.HasChildNodes == false && node.Attributes != null)
            {
                Response.Write("<script type='text/javascript'>alert('"+node.Name+"');</script>");
                if (node.Attributes["code"].Value == this.Request["code"]&&
                    node.Attributes["username"].Value == this.Request["username"])
                {
                    loginRole = node.Attributes["role"].Value;
                    admit = true;
                    Session["role"] = node.Attributes["role"].Value;
                    Session["username"] = node.Attributes["username"].Value;
                    Session["email"] = node.Attributes["email"].Value;
                }
            }
            else
            {
                foreach (XmlNode child in node.ChildNodes)
                    runningThrough(child);
            }
        }*/
    }
}