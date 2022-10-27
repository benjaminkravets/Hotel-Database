<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="hotelclient._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Book Hotel</h1>

        <div class="row">
            <div class="col-md-4">

                <h3 class="lead">&nbsp;</h3>
                <h2>Select Arrival and Departure &nbsp</h2>

                <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" OnPreRender="Calendar_1_on_load" OnDayRender="Calendar1_OnDayRender"></asp:Calendar>

                <h5>&nbsp;</h5>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <h5>&nbsp;</h5>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

                <p>
                </p>
            </div>

            <div class="col-md-4">
                <h3 class="lead">&nbsp;</h3>
                <h3 class="lead">&nbsp;</h3>
                    <h3 class="lead">&nbsp;</h3>
                <h3 class="lead">&nbsp;</h3>
                    <h3 class="lead">&nbsp;</h3>
                <p>

                    <asp:TextBox ID="TextBox4" runat="server" placeholder="Zip Code"></asp:TextBox>
                    
                </p>
                <h5>
                    
                        <asp:Button ID="check_availablity" runat="server" OnClick="check_availablity_Click" Text="Check Availability" />
                    </h5>
            </div>
            <div class="col-md-4">

                <h3 class="lead">&nbsp;</h3>

                <p>
                    <asp:ListBox ID="available_hotels" runat="server" Height="100%" Width="100%"></asp:ListBox>
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