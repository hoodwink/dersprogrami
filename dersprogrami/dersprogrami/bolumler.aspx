<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bolumler.aspx.cs" Inherits="dersprogrami.bolumler" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css"> 
    .gridPanelBolum
        {
            float:right;
          top:-160px;
          position:relative;
           margin-right:5px;
        }
        .btnSaveCls
        {
            float:left;
            position:relative;
            top:10px;
            margin-left:50px;
        }
        .radioYok
        {
            margin-left:1px;
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
    <ext:Store ID="source_bolum" runat="server">
        <Reader>
            <ext:JsonReader IDProperty="Value">
                <Fields>
                    <ext:RecordField Name="bolum_ID" />
                    <ext:RecordField Name="fakulte_ID" />
                    <ext:RecordField Name="bolum_Kodu" />
                    <ext:RecordField Name="bolum_Adi" />
                    <ext:RecordField Name="bolum_baskanKod" />
                    <ext:RecordField Name="subeSayisi" />
                    <ext:RecordField Name="sure_ID" />
                </Fields>
            </ext:JsonReader>
        </Reader>
    </ext:Store>
    <ext:Store ID="source_fakulte" runat="server">
        <Reader>
            <ext:JsonReader IDProperty="Value">
                <Fields>
                    <ext:RecordField Name="fakulte_ID" />
                    <ext:RecordField Name="fakulte_Adi" />
                </Fields>
            </ext:JsonReader>
        </Reader>
    </ext:Store>
    <div>
        <ext:Panel ID="Panel1" runat="server" Width="900" Height="450" Title="Bölüm Ekleme Formu"
            Padding="15">
            <Items>
            <ext:ComboBox ID="cmbx_fakulte" runat="server" FieldLabel="Fakülte" Width="250" StoreID="source_fakulte"
                Editable="false" DisplayField="fakulte_Adi" ValueField="fakulte_ID" Mode="Local" TriggerAction="All" 
                EmptyText="Lütfen fakülte seçin">
            </ext:ComboBox>
            <ext:TextField ID="txt_bolumAdi" runat="server" FieldLabel="Bölüm Adı" Width="250" />
            <ext:TextField ID="txt_bolumKodu" runat="server" FieldLabel="Bölüm Kodu" Width="250" />
            <ext:TextField ID="txt_subeSayisi" runat="server" FieldLabel="Şube Sayısı" Width="250" />
            <ext:TextField ID="txt_baskanKod" runat="server" FieldLabel="Bölüm Başkanı Kodu" Width="250" /> 
              
            <ext:RadioGroup ID="RadioGroup1"  runat="server" Width="200" FieldLabel="İkili Öğretim" >
                    <Items>
                     <ext:Radio ID="radioVar" runat="server" BoxLabel="Var" Checked="false" />
                     <ext:Radio ID="radioYok" runat="server" BoxLabel="Yok" Checked="false" Cls="radioYok" />
                    </Items>
               </ext:RadioGroup>       
                  
            <ext:Button ID="btn_Save" runat="server" Text="Kaydet" Icon="Disk" Width="75" Height="40" Cls="btnSaveCls" OnDirectClick="btn_Save_Click"/>

            <ext:GridPanel ID="grdpnl_bolum" Cls="gridPanelBolum" runat="server" StoreID="source_bolum"
                Icon="Clipboard" StripeRows="true" Title="Bölüm Listesi" Width="590" Height="320"
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
                    <ext:Column Header="No" Width="50" DataIndex="bolum_Kodu">
                    </ext:Column>
                    <ext:Column Header="Bölüm Adı" Width="150" DataIndex="bolum_Adi">
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

