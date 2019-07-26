<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="domov.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <section>
			<div class='wrapper'>  				
				<img id="naslovna" src="slike/pizzaolive-tomatoe.jpg" alt="pizza z olivami">
				
				<div class='description'> 	
					<h1 id="slogan">PRISTNA <br> ITALIJANSKA <br> KUHINJA</h1>					 					
				</div>  				 
			</div>				
		</section>
		
		<section id="text">
			Dobrodošli na strani restavracije Anatra, ki je naj novost v Celju. Nudimo najslastnejše dobrote italijaskega izvora s svežimi sestavinami.
			
			<table>
				<th colspan=3 cellpadding="10"> 
					ODPIRALNI ČAS
				</th>
				<tr>
					<td>ponedeljek</td>
					<td>9:00</td>
					<td>23:00</td>
				</tr>
				<tr>
					<td>torek</td>
					<td>9:00</td>
					<td>23:00</td>
				</tr>
				<tr>
					<td>sreda</td>
					<td>9:00</td>
					<td>23:00</td>
				</tr>
				<tr>
					<td>četrtek</td>
					<td>9:00</td>
					<td>23:00</td>
				</tr>
				<tr>
					<td>petek</td>
					<td>9:00</td>
					<td>23:00</td>
				</tr>
				<tr>
					<td>sobota</td>
					<td>12:00</td>
					<td>20:00</td>
				</tr>
				<tr>
					<td>nedelja</td>
					<td>12:00</td>
					<td>20:00</td>
				</tr>
			</table>
        </section>
</asp:Content>

