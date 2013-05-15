<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="dersprogrami.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cumhuriyet Üniversitesi Ders Programı Hazırlama Uygulaması</title>
</head>

<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="ResourceManager1" runat="server" />
        <ext:Window 
            ID="windowLogin" 
            runat="server" 
            Closable="false"
            Resizable="false"
            Height="150" 
            Icon="Lock" 
            Title="Kullanıcı Girişi"
            Draggable="false"
            Width="350"
            Modal="true"
            Padding="5"
            Layout="Form">
            <Items>
                <ext:TextField 
                    ID="txtUserName" 
                    runat="server" 
                    FieldLabel="Kullanıcı Adı" 
                    AllowBlank="false"
                    MaxLength="60"
                    AnchorHorizontal="100%"
                    />
                <ext:TextField 
                    ID="txtPassword" 
                    runat="server" 
                    InputType="Password" 
                    FieldLabel="Parola" 
                    AllowBlank="false"
                    MaxLength="16" 
                    AnchorHorizontal="100%"
                    />
                    
                <ext:Label
                ID="lblResponse"
                runat="server"
                AnchorHorizontal="100%" 
                />
            </Items>
            <Buttons>
                <ext:Button ID="btnLogin" runat="server" Text="Giriş Yap" Icon="Accept">
                    <Listeners>
                        <Click Handler="
                            if (!#{txtUserName}.validate() || !#{txtPassword}.validate()) {
                                Ext.Msg.alert('Error','Kullanıcı adı ve şifre alanları boş geçilemez');
                                return false; 
                            }" />
                    </Listeners>
                    <DirectEvents>
                        <Click OnEvent="btnLogin_Click">
                            <EventMask ShowMask="true" Msg="Doğrulanıyor..." MinDelay="500" />
                        </Click>
                    </DirectEvents>
                </ext:Button>
            </Buttons>
        </ext:Window>
    </form>
</body>
</html>
