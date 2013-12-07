<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WebPage.aspx.cs" Inherits="WebPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 107px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="ListAllCategories" TypeName="com.k2.ws.SupplierCompany"></asp:ObjectDataSource>
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">
        <asp:ListBox ID="ListBox1" runat="server" Height="333px" Width="130px" DataSourceID="ObjectDataSource1" DataTextField="InnerText" DataValueField="InnerText" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox>
                </td>
                <td>
                    <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AllowSorting="True" PageSize="8" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanged="DataGrid1_PageIndexChanged" OnSortCommand="DataGrid1_SortCommand">
                        <AlternatingItemStyle BackColor="White" />
                        <EditItemStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#E3EAEB" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    </asp:DataGrid>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Refresh" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
