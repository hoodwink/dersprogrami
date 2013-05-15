<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ogretimElemani.aspx.cs" Inherits="dersprogrami.ogretimElemani" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css"> 
    .gridPanelHoca
        {
            float:right;
            position:relative;
            top:-182px;
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
            Ext.net.DirectMethods.commandProcess(command, record.data.hoca_ID);
        };    
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" />
    <ext:Store ID="source_unvan" runat="server">
        <Reader>
            <ext:JsonReader IDProperty="Value">
                <Fields>
                    <ext:RecordField Name="unvan_ID" />
                    <ext:RecordField Name="unvan_Adi" />
                    <ext:RecordField Name="ders_yuku" />
                </Fields>
            </ext:JsonReader>
        </Reader>
    </ext:Store>
    <ext:Store ID="store_Hoca" runat="server">
        <Reader>
            <ext:JsonReader IDProperty="Value">
                <Fields>
                    <ext:RecordField Name="hoca_ID" />
                    <ext:RecordField Name="sicil_No" />
                    <ext:RecordField Name="hoca_Adi" />
                    <ext:RecordField Name="bolum_Adi" />
                    <ext:RecordField Name="fakulte_Adi" />
                </Fields>
            </ext:JsonReader>
        </Reader>
    </ext:Store>
    <div>
        <ext:Panel ID="Panel1" runat="server" Width="900" Height="450" Title="Öğretim Elemanı Ekleme Formu"
            Padding="15">
            <Items>
            <ext:TextField ID="txt_sicilNo" runat="server" FieldLabel="Sicil Numarası" Width="250" />
            <ext:TextField ID="txt_adiSoyadi" runat="server" FieldLabel="Adı Soyadı" Width="250" />
            <ext:TextField ID="txt_kod" runat="server" FieldLabel="Kodu" Width="250" />
            <ext:TextField ID="txt_dersYuk" runat="server" FieldLabel="Ders Yükü" Width="250" />
            <ext:ComboBox ID="cmbx_unvan" runat="server" FieldLabel="Ünvan" Width="250" Editable="false"
                StoreID="source_unvan" DisplayField="unvan_Adi" ValueField="unvan_ID" Mode="Local"
                TriggerAction="All" EmptyText="Lütfen ünvan seçin">
            </ext:ComboBox>
            <ext:ComboBox ID="cmbx_program" runat="server" FieldLabel="Programı" Width="250"
                Editable="false" Mode="Local" TriggerAction="All" EmptyText="Lütfen program seçin">
            </ext:ComboBox>
            <ext:ComboBox ID="cmbx_gorevKadrosu" runat="server" FieldLabel="Görev Kadrosu" Width="250"
                Editable="false" Mode="Local" TriggerAction="All" EmptyText="Görev kadrosunu seçin">
            </ext:ComboBox>
            <ext:Button ID="btn_Save" runat="server" Text="Kaydet" Icon="Disk" Width="75" Height="40" Cls="btnSaveCls"/>
            <ext:GridPanel ID="grdpnl_hoca" Cls="gridPanelHoca" runat="server" StoreID="store_Hoca"
                Icon="Clipboard" StripeRows="true" Title="Hoca Listesi" Width="590" Height="320"
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
                    <ext:Column Header="No" Width="50" DataIndex="hoca_ID">
                    </ext:Column>
                    <ext:Column Header="Sicil No" Width="75" DataIndex="sicil_No">
                    </ext:Column>
                    <ext:Column Header="Adı Soyadı" Width="150" DataIndex="hoca_Adi">
                    </ext:Column>
                    <ext:Column Header="Fakülte Adı" Width="150" DataIndex="fakulte_Adi">
                    </ext:Column>
                    <ext:Column Header="Bölüm Adı" Width="155" DataIndex="bolum_Adi">
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
