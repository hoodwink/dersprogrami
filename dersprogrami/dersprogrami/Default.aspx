<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="dersprogrami._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cumhuriyet Üniversitesi Ders Programı Hazırlama Uygulaması</title>
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

    <ext:Viewport ID="Viewport1" runat="server" Layout="fit">
        <Items>
            <ext:TabPanel ID="TabPanel1" runat="server" Border="false">
                <Defaults>
                    <ext:Parameter Name="BodyStyle" Value="padding:10px;" Mode="Value" />
                </Defaults>
                <Items>
                    <ext:Panel ID="Tab1" runat="server" Title="Dönem Başlama-Bitiş Tarihleri Ekleme Formu">
                    </ext:Panel>
                    <ext:Panel ID="Tab2" runat="server" Title="Öğretim Elemeanı Ekleme Formu">
                        <Items>
                            <ext:Panel ID="Panel1" runat="server" Width="700" Height="500" Title="Öğretim Elemanı Ekleme Formu"
                                Padding="15">
                                <Items>
                                    <ext:TextField ID="txt_sicilNo" runat="server" FieldLabel="Sicil Numarası" Width="250" />
                                    <ext:TextField ID="txt_adiSoyadi" runat="server" FieldLabel="Adı Soyadı" Width="250" />
                                    <ext:TextField ID="txt_kod" runat="server" FieldLabel="Kodu" Width="250" />
                                    <ext:TextField ID="txt_dersYuk" runat="server" FieldLabel="Ders Yükü" Width="250" />
                                    <ext:ComboBox ID="cmbx_unvan" runat="server" FieldLabel="Ünvan" Width="250" Editable="false"
                                        StoreID="source_unvan" DisplayField="unvan_Adi" ValueField="unvan_ID"  Mode="Local"
                                        TriggerAction="All" EmptyText="Lütfen ünvan seçin">                                        
                                    </ext:ComboBox>
                                    <ext:ComboBox ID="cmbx_program" runat="server" FieldLabel="Programı" Width="250" Editable="false"
                                        Mode="Local"
                                        TriggerAction="All" EmptyText="Lütfen program seçin">                                        
                                    </ext:ComboBox>
                                    <ext:ComboBox ID="cmbx_gorevKadrosu" runat="server" FieldLabel="Görev Kadrosu" Width="250" Editable="false"
                                        Mode="Local"
                                        TriggerAction="All" EmptyText="Görev kadrosunu seçin">                                        
                                    </ext:ComboBox>

                                </Items>
                            </ext:Panel>
                        </Items>
                    </ext:Panel>
                    <ext:Panel ID="Tab3" runat="server" Title="Bölüm Ekleme Formu">
                    </ext:Panel>
                    <ext:Panel ID="Tab4" runat="server" Title="Ders Ekleme Formu">
                    </ext:Panel>
                    <ext:Panel ID="Tab5" runat="server" Title="Derslik Ekleme Formu">
                    </ext:Panel>
                </Items>
            </ext:TabPanel>
        </Items>
    </ext:Viewport>
    </form>
</body>
</html>
