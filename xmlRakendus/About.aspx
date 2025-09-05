<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="xmlRakendus.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h1>XML katsetamine: David Lennuk sugupuu</h1>
    <div>
        <asp:Xml runat="server"
            DocumentSource="~/Davidpuu.xml"
            TransformSource="~/David.xslt">
        </asp:Xml>
    </div>
    </main>
</asp:Content>
