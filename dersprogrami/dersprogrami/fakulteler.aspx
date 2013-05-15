<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fakulteler.aspx.cs" Inherits="dersprogrami.fakulteler" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css"> 
    .gridPanelFakulte
        {
            float:right;
          top:-90px;
          position:relative;
           margin-right:5px;
        }
        .btnSaveCls
        {
            float:left;
            position:relative;
            top:10px;
            margin-left:100px;
        }
    </style>

    <script type="text/javascript">
        var GridCommand = function (command, record, rowIndex) {
            Ext.net.DirectMethods.commandProcess(command, record.data.fakulte_ID);
        };    
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" />
    <ext:Store ID="source_fakulte" runat="server">
        <Reader>
            <ext:JsonReader IDProperty="Value">
                <Fields>
                    <ext:RecordField Name="fakulte_ID" />
                    <ext:RecordField Name="fakulte_Kodu" />
                    <ext:RecordField Name="fakulte_Tipi" />
                    <ext:RecordField Name="fakulte_Adi" />
                    <ext:RecordField Name="fakulte_KisaAdi" />
                    <ext:RecordField Name="fakulte_Dekan" />
                    <ext:RecordField Name="fakulte_Yard1" />
                    <ext:RecordField Name="fakulte_Yard2" />
                </Fields>
            </ext:JsonReader>
        </Reader>
    </ext:Store>
    <div>
        <ext:Panel ID="Panel1" runat="server" Width="900" Height="450" Title="Fakülte Ekleme Formu"
            Padding="15">
            <Items>
            <ext:TextField ID="txt_fakulteAdi" runat="server" FieldLabel="Fakülte Adı" Width="250" />
            <ext:TextField ID="txt_kisaAdi" runat="server" FieldLabel="Fakülte Kısa Adı" Width="250" />
            <ext:TextField ID="txt_kod" runat="server" FieldLabel="Fakülte Kodu" Width="250" />
            <ext:TextField ID="txt_dekanKod" runat="server" FieldLabel="Dekan Kodu" Width="250" />            
            <ext:Button ID="btn_Save" runat="server" Text="Kaydet" Icon="Disk" Width="75" Height="40" Cls="btnSaveCls" OnDirectClick="btn_Save_Click"/>

            <ext:GridPanel ID="grdpnl_fakulte" Cls="gridPanelFakulte" runat="server" StoreID="source_fakulte"
                Icon="Clipboard" StripeRows="true" Title="Fakülte Listesi" Width="590" Height="320"
                Border="true" AutoExpandColumn="">
                <columnmodel id="ColumnModel1" runat="server">
                <Columns>
                <ext:CommandColumn Width="55" Header="Sil">
                 <Commands>
                  <ext:GridCommand CommandName="Delete" Icon="Delete">
                    <ToolTip Text="Sil" />                      
                  </ext:GridCommand> 
                </Commands>                                          
               </ext:CommandColumn> 
                    <ext:Column Header="No" Width="50" DataIndex="fakulte_Kodu">
                    </ext:Column>
                    <ext:Column Header="Fakülte Adı" Width="150" DataIndex="fakulte_Adi">
                    </ext:Column>                    
                </Columns>
            </columnmodel>
                <selectionmodel>
                <ext:RowSelectionModel runat="server" ID="ctl26" />
            </selectionmodel>
                <loadmask showmask="true" />
                <bottombar>
                <ext:PagingToolbar runat="server" PageSize="25" ID="ctl27" />
            </bottombar>
            <Listeners>
               <Command Fn="GridCommand" />
            </Listeners>
            </ext:GridPanel>
            </Items>
        </ext:Panel>
    </div>
    </form>
</body>
</html>
