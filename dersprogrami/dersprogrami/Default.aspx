<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="dersprogrami._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cumhuriyet Üniversitesi Ders Programı Hazırlama Uygulaması</title>
    <style type="text/css">
    .ViewportCls
    {
    	float:left;
    	position:relative;
    	top:2px;
    	margin-left:5px;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" />

    <ext:Viewport ID="Viewport1" runat="server" Layout="fit" Cls="ViewportCls">
        <Items>
            <ext:TabPanel ID="TabPanel1" runat="server" Border="false">
                <Defaults>
                    <ext:Parameter Name="BodyStyle" Value="padding:10px;" Mode="Value" />
                </Defaults>
                <Items>
                    <ext:Panel ID="Tab1" runat="server" Title="Dönem Başlama-Bitiş Tarihleri Ekleme Formu">
                    </ext:Panel>
                    <ext:Panel ID="Tab2" runat="server" Title="Öğretim Elemanı Ekleme Formu">
                          <AutoLoad Url="ogretimElemani.aspx" Mode="IFrame" ShowMask="true" />                          
                    </ext:Panel>
                    <ext:Panel ID="Tab3" runat="server" Title="Fakülte Ekleme Formu">
                    <AutoLoad Url="fakulteler.aspx" Mode="IFrame" ShowMask="true" />
                    </ext:Panel>
                    <ext:Panel ID="Tab4" runat="server" Title="Bölüm Ekleme Formu">
                    <AutoLoad Url="bolumler.aspx" Mode="IFrame" ShowMask="true" />
                    </ext:Panel>
                    <ext:Panel ID="Tab5" runat="server" Title="Ders Ekleme Formu">
                    </ext:Panel>
                    <ext:Panel ID="Tab6" runat="server" Title="Derslik Ekleme Formu">
                    </ext:Panel>
                </Items>
            </ext:TabPanel>
        </Items>
    </ext:Viewport>
    </form>
</body>
</html>
