<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="jedilnik.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css1.css">
    <section><br><br><br><br></section>

    <!--Predjed,Začetna jed,Glavna jed,Sladica,Rdeče vino-->
    <section id="text">
			<div class="menu-body">
	
				<!-- Section starts: Predjedi -->
				<div class="menu-section">
					<h2 class="menu-section-title">Predjedi</h2>				    
                    <div id="predjedi" runat="server"></div>	                    							
				</div>
				<!-- Section ends: Predjedi -->

				
				<!-- Section starts: Začetne jedi -->
				<div class="menu-section">
					<h2 class="menu-section-title">Začetne jedi</h2>
				    <div id="zacetneJedi" runat="server"></div>					                                                                    				
				</div>
				<!-- Section ends: Začetne jedi -->	
                
                <!-- Section starts: Glavne jedi -->
				<div class="menu-section">
					<h2 class="menu-section-title">Glavne jedi</h2>				    
                    <div id="glavneJedi" runat="server"></div>	                    							
				</div>
				<!-- Section ends: Glavne jedi -->


                <!-- Section starts: Sladice -->
				<div class="menu-section">
					<h2 class="menu-section-title">Sladice</h2>				    
                    <div id="sladice" runat="server"></div>	                    							
				</div>
				<!-- Section ends: Sladice -->


                <!-- Section starts: Rdeča vina -->
				<div class="menu-section">
					<h2 class="menu-section-title">Rdeča vina</h2>				    
                    <div id="rdecaVina" runat="server"></div>	                    							
				</div>
				<!-- Section ends: Rdeča vina -->
			</div>			
		</section>
</asp:Content>

