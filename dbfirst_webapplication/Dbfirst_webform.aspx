<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dbfirst_webform.aspx.cs" Inherits="dbfirst_webapplication.Dbfirst_webform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            text-align: justify;
            background-color: orange;
            width: 1073px;
            height: 426px;
        }
        .auto-style3 {
            color: orange;
            font-size: large;
        }
        .auto-style4 {
            color: white;
            font-size: large;
            background-color: orange;
        }
        .auto-style5 {
            background-color: orange;
        }
        #form1 {
            background-color: orange;
            text-align: justify;
        }
    </style>
</head>
<body style="background-color: orange">
    

    <form id="form1" runat="server" >
    
        <div class="auto-style2">
            <strong>
                 <asp:HiddenField ID="hdnID" runat="server" Value="0" />
            &nbsp;<span class="auto-style4">First Name :&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtfname" runat="server" CssClass="auto-style3"></asp:TextBox>
            <br class="auto-style4" />
            <br class="auto-style4" />
            <span class="auto-style4">Last Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
            <asp:TextBox ID="txtlname" runat="server" CssClass="auto-style3"></asp:TextBox>
            <br class="auto-style4" />
            <br class="auto-style4" />
            <span class="auto-style4">Age :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><asp:TextBox ID="txtage" runat="server" CssClass="auto-style3"></asp:TextBox>
            <br class="auto-style3" />
            <br class="auto-style3" />
            <span class="auto-style5">&nbsp;</span><span class="auto-style4">Gender :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
            <asp:TextBox ID="txtgender" runat="server" CssClass="auto-style3"></asp:TextBox>
            <br class="auto-style3" />
            <br class="auto-style3" />
            <span class="auto-style5">&nbsp;</span><span class="auto-style4">Email :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
            <asp:TextBox ID="txtemail" runat="server" CssClass="auto-style3"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
            <br />
            <br />
            <span class="auto-style4">Phone Number :&nbsp;&nbsp;&nbsp; </span>
            <asp:TextBox ID="txtphonenumber" runat="server" CssClass="auto-style3"></asp:TextBox>
            <br />
            <br />
        <asp:Button ID="btnsave" runat="server" OnClick="btnsave_Click" style="font-weight: 700; font-size: large ; background-color: greenyellow" Text="Save From Here" Width="271px" />
            <br />
            <br />
            <br />
            <asp:RadioButtonList ID="RadioButtonList11" runat="server" style="margin-bottom: 0px" AutoPostBack ="True" OnSelectedIndexChanged="RadioButtonList11_SelectedIndexChanged">
                <asp:ListItem Text ="Load All People" Value ="All"></asp:ListItem>
                <asp:ListItem Text ="Only Male" Value ="Male"></asp:ListItem>
                <asp:ListItem Text ="Only Female" Value ="Female"></asp:ListItem>
            </asp:RadioButtonList>
            <br />
    
        <asp:GridView ID="GridView_intro" runat="server" AutoGenerateColumns="False" OnRowCommand="intro_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None" style="font-size: large; margin-left: 0px; margin-top: 23px;" Height="23px" Width="727px" >
            <AlternatingRowStyle BackColor="White" />
           <Columns>
               <asp:TemplateField HeaderText="FirstName">
                    <AlternatingItemTemplate>
                        <asp:HiddenField ID="hdnID" runat="server" Value='<%# Bind("ID") %>' />
                        <asp:Label ID="lblFirstName" runat="server" Text='<%# Bind("FirstName") %>' CommandName="SELECT"></asp:Label>
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                        <asp:HiddenField ID="hdnID" runat="server" Value='<%# Bind("ID") %>' />
                        <asp:Label ID="lblFirstName0" runat="server" Text='<%# Bind("FirstName") %>' CommandName="SELECT"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="LastName">
                    <AlternatingItemTemplate>
                        <asp:Label ID="lblLastName" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblLastName0" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Age">
                    <AlternatingItemTemplate>
                        <asp:Label ID="lblAge" runat="server" Text='<%# Bind("Age") %>'></asp:Label>
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblAge0" runat="server" Text='<%# Bind("Age") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Gender">
                    <AlternatingItemTemplate>
                        <asp:Label ID="lblGender" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGender0" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <AlternatingItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblEmail0" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PhoneNumber">
                    <AlternatingItemTemplate>
                        <asp:Label ID="lblPhoneNumber" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:Label>
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPhoneNumber0" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit | Delete">
                    <AlternatingItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%# Container.DataItemIndex %>' CommandName="EDT" Text="Edit"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%# Container.DataItemIndex %>' CommandName="DLT" Text="Delete"></asp:LinkButton>
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit0" runat="server" CommandArgument='<%# Container.DataItemIndex %>' CommandName="EDT" Text="Edit"></asp:LinkButton>
                        | 
                        <asp:LinkButton ID="lnkDelete0" runat="server" CommandArgument='<%# Container.DataItemIndex %>' CommandName="DLT" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
           </Columns>
                
            <EditRowStyle BackColor="Black" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
                
        </asp:GridView>
    
            <br />
    
            </strong>
        </div>
    </form>
</body>
</html>
