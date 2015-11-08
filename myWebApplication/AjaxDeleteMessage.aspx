
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxDeleteMessage.aspx.cs" Inherits="myWebApplication.AjaxDeleteMessage" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ OutputCache Duration="1" VaryByParam="None" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/filteredstyle.css" rel="stylesheet" type="text/css"/>
    <script>
 
    </script>
</head>
<body>
      
    <form id="form1" runat="server">
    <div  id="container">
        
        client: 
        <script>
            document.write(Date());
        </script>
        <br />
        <asp:Label ID="Label5" runat="server" Text="Server: "></asp:Label>
        <asp:Label ID="Label4" runat="server"> </asp:Label>

        <asp:scriptmanager ID ="ScriptManager1" runat="server"></asp:scriptmanager>


        <asp:UpdatePanel ID="UpdatePanel1" runat="server">

            <ContentTemplate>
                <asp:Label ID="Label1" runat="server" Text="Department"></asp:Label>&nbsp&nbsp
                <asp:DropDownList ID="DropDownList1" runat="server"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                <br /><br />
                <asp:Label ID="Label2" runat="server" Text="Enter Search Value:"></asp:Label><asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox><asp:Button ID="Button1" runat="server" Text="Find"  OnClick="Button1_Click" />

            </ContentTemplate>
        </asp:UpdatePanel><br />

        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID ="DropDownList1" EventName ="SelectedIndexChanged" />    
                <asp:AsyncPostBackTrigger ControlID ="Button1" EventName ="Click" />
            </Triggers>
            
            <ContentTemplate>
                <asp:Button runat="server" Text="AddNewRecord"  OnClick="AddNewRecord" />
                
                <asp:GridView ID="peopleGridView" runat="server"  HeaderStyle-CssClass="gridViewHeader" AllowSorting ="True" BackColor="White"  DataKeyNames="emplid"
                    BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnSorting="peopleGridView_Sorting" 
                    OnRowCreated="peopleGridView_RowCreated"  Width="1200px" AutoGenerateColumns="False"  OnRowEditing ="peopleGridView_RowEditing"  OnRowUpdating="peopleGridView_RowUpdating"
                    OnRowDeleting="peopleGridView_RowDeleting" OnRowCommand="peopleGridView_RowCommand" OnRowCancelingEdit="peopleGridView_RowCancelingEdit" OnRowDataBound="peopleGridView_RowDataBound" >
                    <AlternatingRowStyle BackColor="White"  />

                        <Columns>
                            
                             <asp:TemplateField HeaderText="Click To" ShowHeader="False">
                     
                                <EditItemTemplate>
                                    <asp:Button ID="btnupdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                    &nbsp;<asp:Button ID="btncancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />

                                </EditItemTemplate>

                                <ItemTemplate>
                                    <asp:Button ID="btnedit" runat="server" CausesValidation="False"   CommandName="Edit" Text="Edit" />

                                       &nbsp;<asp:Button ID="btndelete" runat="server" CausesValidation="False" CommandArgument='<%# Eval("emplid") %>'  OnClick="DeleteRecord" CommandName="Delete" Text="Delete" />



                                <cc1:ConfirmButtonExtender ID="cbe" runat="server" DisplayModalPopupID="mpe" TargetControlID="btndelete"></cc1:ConfirmButtonExtender>
                                <cc1:ModalPopupExtender ID="mpe" runat="server" PopupControlID="pnlPopup" TargetControlID="btndelete" OkControlID = "btnYes"
                                    CancelControlID="btnNo" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>

                                <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none">
                                    <div class="header">
                                        Confirmation
                                    </div>
                                    <div class="body">
                                        Do you want to delete this record?
                                    </div>
                                    <div class="footer" align="right">
                                        <asp:Button ID="btnYes" runat="server" Text="Yes" />
                                        <asp:Button ID="btnNo" runat="server" Text="No" />
                                    </div>
                                </asp:Panel>




                                </ItemTemplate>
                                <HeaderStyle CssClass="cmdHeader" />

                                 <FooterTemplate>
                                     <asp:Button ID="btnAdd" runat="server" Text="Insert" />  
                                 </FooterTemplate>


                            </asp:TemplateField> 


                            <asp:TemplateField HeaderText="Last Name" SortExpression="lastName" ItemStyle-Wrap="false"  ItemStyle-CssClass="LN">
                     
                                <ItemTemplate>
                                    <%# Eval("lastName") %>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox runat= "server" ID="txtlastName" Text='<%# Eval("lastName") %>' CssClass="LN"  />

                                </EditItemTemplate>

                                <ItemStyle CssClass="LN" Wrap="False" />

                                 <FooterTemplate>
                                      <asp:TextBox ID="txtLN" runat="server"></asp:TextBox>
                                 </FooterTemplate>

                            </asp:TemplateField> 

                            <asp:TemplateField HeaderText="First Name" SortExpression="firstName" ItemStyle-Wrap="false" ItemStyle-CssClass="FN">
                     
                                <ItemTemplate>
                                    <%# Eval("firstName") %>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox runat= "server" ID="txtfirstName" Text='<%# Eval("firstName") %>'  CssClass="FN"/>

                                </EditItemTemplate>

                                <ItemStyle CssClass="FN" Wrap="False" />

                            <FooterTemplate>
                                     <asp:TextBox ID="txtFN" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Department" SortExpression="department" ItemStyle-Wrap="false" ItemStyle-CssClass="DPT">
                     
                                <ItemTemplate>
                                    <%# Eval("department") %>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox runat= "server" ID="txtdepartment" Text='<%# Eval("department") %>'  CssClass="DPT"/>

                                </EditItemTemplate>

                                <ItemStyle CssClass="DPT" Wrap="False" />


                                 <FooterTemplate>
                                     <asp:TextBox ID="txtDPT" runat="server"></asp:TextBox>
                                 </FooterTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText ="Room" SortExpression="room" ItemStyle-Wrap="false" ItemStyle-CssClass="RM">
                     
                                <ItemTemplate>
                                    <%# Eval("room") %>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox runat= "server" ID="txtroom" Text='<%# Eval("room") %>'  CssClass="RM"/>

                                </EditItemTemplate>

                                <ItemStyle CssClass="RM" Wrap="False" />



                                <FooterTemplate>
                                     <asp:TextBox ID="txtRM" runat="server"></asp:TextBox>
                                 </FooterTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText ="Phone" SortExpression="phone" ItemStyle-Wrap="false" ItemStyle-CssClass="PHN">
                     
                                <ItemTemplate>
                                    <%# Eval("phone") %>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox runat= "server" ID="txtphone" Text='<%# Eval("phone") %>' CssClass="PHN" />

                                </EditItemTemplate>

                                <ItemStyle CssClass="PHN" Wrap="False" />



                                 <FooterTemplate>
                                     <asp:TextBox ID="txtPHN" runat="server"></asp:TextBox>
                                 </FooterTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText ="eMail" SortExpression="email" ItemStyle-CssClass="gridViewHeader" ItemStyle-Wrap="false">
                                 
                                <ItemTemplate>
                                    <a href='mailto:<%# Eval("email") %>'><%# Eval("email") %></a>
               
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:TextBox runat= "server" ID="txtemail" Text='<%# Eval("email") %>' CssClass="gridViewHeader" />

                                </EditItemTemplate>

                                <ItemStyle CssClass="gridViewHeader" Wrap="False" />


                                <FooterTemplate>
                                    <asp:TextBox ID="txtEML" runat="server"></asp:TextBox>
                                 </FooterTemplate>

                            </asp:TemplateField>
 
                        </Columns>

                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" CssClass="gridViewHeader" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    <EmptyDataTemplate>
                        <asp:Button ID="btnAdd" runat="server" Text="Insert" />
                        <asp:TextBox ID="txtLN" runat="server"></asp:TextBox>
                        <asp:TextBox ID="txtFN" runat="server"></asp:TextBox>
                        <asp:TextBox ID="txtDPT" runat="server"></asp:TextBox>
                        <asp:TextBox ID="txtRM" runat="server"></asp:TextBox>
                        <asp:TextBox ID="txtPHN" runat="server"></asp:TextBox>
                        <asp:TextBox ID="txtEML" runat="server"></asp:TextBox>
                    </EmptyDataTemplate>
            
                </asp:GridView><br />

                <asp:Label ID="Label3" runat="server" ></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
        <p>&nbsp;</p>

    </form>
    
</body>
</html>
