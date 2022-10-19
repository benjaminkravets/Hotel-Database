<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="hotelclient._Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Book Hotel</h1>

        <div class="row">
            <div class="col-md-4">

                <h3 class="lead">Check Availability</h3>
                <h2>Check In</h2>

                <asp:calendar id="Calendar1" runat="server" onselectionchanged="Calendar1_SelectionChanged" OnPreRender="Calendar_1_on_load" OnDayRender="Calendar1_OnDayRender"></asp:calendar>

                <h5>&nbsp</h5>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>

                <p>
                    <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
                </p>
            </div>
            <div class="col-md-4">

                <h3 class="lead">&nbsp</h3>
                <h2>Check Out</h2>
                <asp:Calendar ID="Calendar2" runat="server" OnSelectionChanged="Calendar2_SelectionChanged" ></asp:Calendar>
                
                <h5>&nbsp</h5>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

                <p>
                    <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
                </p>
            </div>
            <div class="col-md-4">
                <h3 class="lead">&nbsp</h3>
                

                <p>
                    
                    <asp:TextBox ID="TextBox4" runat="server" placeholder="Zip Code"></asp:TextBox>
                    <asp:Button ID="check_availability" runat="server" OnClick="check_availability_Click" Text="Button" />
                    <h5>&nbsp</h5>
                    <a class="btn btn-default" >Check Availability &raquo;</a>
                </p>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>
</asp:Content>