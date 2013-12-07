using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPage : System.Web.UI.Page
{
    public com.k2.ws.SupplierCompany client;

    protected void Page_Load(object sender, EventArgs e)
    {
        client = new com.k2.ws.SupplierCompany();
    }
    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e) //Event fires when user selects a catagory
    {
        bindData();  
    }
    protected void bindData()
    {
        string text = ListBox1.SelectedItem.ToString(); //Get catagory string from listbox
        XmlNode node = client.SearchProductByCategory(text); //Fetch XML node using string
        XmlNodeReader nodeReader = new XmlNodeReader(node); // Create XML nodeReader from node
        XmlDocument doc = new XmlDocument(); //Create XmlDocument to load xmlNodeReader, and save XML to file
        doc.Load(nodeReader);
        doc.Save(Server.MapPath("~/Data/XML1File.xml")); // Saves XML data to file
        DataSet ds = new DataSet(); // Creates a new dataset to bind to datagrid
        ds.ReadXml(Server.MapPath("~/Data/XML1File.xml")); // Reads data from the XML file
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }
    protected void DataGrid1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex; 
        bindData();
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ListBox1.DataBind();
    }
    protected void DataGrid1_SortCommand(object source, DataGridSortCommandEventArgs e)
    {
        DataSet ds = new DataSet();
        ds.ReadXml(Server.MapPath("~/Data/XML1File.xml"));
        DataView dv = new DataView(ds.Tables[0]); // Sets the data view as the column name the user selected for sorting
        dv.Sort = e.SortExpression;
        DataGrid1.DataSource = dv;
        DataGrid1.DataBind();
        
    }
}