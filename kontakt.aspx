<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="kontakt.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section><br><br><br><br></section>
    <section id="text">
		<div class="container">  
			<form id="contact" action="" method="post">
				<h2 id="h2">Kontaktirajte nas kar preko spleta:</h2>
					<input placeholder="Vaše ime in priimek" type="text" tabindex="1" required autofocus>				
					<input placeholder="Vaša e-pošta" type="email" tabindex="2" required>					
					<input placeholder="Vaša telefonska številka (neobvezno)" type="tel" tabindex="3">					
					<input placeholder="Vaša spletna stran (neobvezno)" type="url" tabindex="4">					
					<textarea placeholder="Vpišite svoje sporočilo semkaj...." tabindex="5" required></textarea>					
					<button name="submit" type="submit" id="contact-submit" data-submit="...Sending" tabindex="6">Pošlji</button>					
			</form>
		</div>		
		<pre>
<b>Telefonska:</b>
+386 23 155 233
		
<b>Epošta:</b>
anatra@info.net
				
<b>Naslov:</b>
Prešernova ulica 4
3000 Celje
		</pre>			
	</section>
</asp:Content>

