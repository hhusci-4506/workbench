using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;
using System.Web.Services;

namespace UIForSpecialist.mulfunctionDb
{
    public partial class treeSearch : System.Web.UI.Page
    {
        
        XmlNode node;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<string> get_content(string nodepath)
        {
            string treeXmlPath = HttpContext.Current.ApplicationInstance.Server.MapPath("~/App_Data/") + "treeData.xml";
            string[] nodes = nodepath.Split(',');
            string RSN = "description";
            string SLTN = "solution";
            XElement root = XElement.Load(treeXmlPath);

            List<string> nodlst = new List<string>(nodes);
            string r = linqThrough(root, nodlst, RSN);
            nodlst = new List<string>(nodes);
            string s = linqThrough(root, nodlst, SLTN);

            List<string> content = new List<string>();
            content.Add(r);
            content.Add(s);
            return content;
        }

        protected static string linqThrough(XElement root, List<string> nodes, string contType)
        {
            string toRT = "nothing";
            if (nodes.Count != 0)
            {
                IEnumerable<XElement> items = root.Elements("item");
                foreach (XElement item in items)
                {
                    if (item.Attribute("text").Value.ToString() == nodes[0])
                    {
                        nodes.RemoveAt(0);
                        toRT = linqThrough(item, nodes, contType);
                        break;
                    }
                }
            }
            else {
                IEnumerable<XElement> contents = root.Elements("userdata");
                foreach (XElement cont in contents)
                {
                    if (cont.Attribute("name").Value.ToString() == contType)
                    {
                        toRT = cont.Value.ToString();
                        break;
                    }
                }
            }
            return toRT;
        }
    }
}