using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    private SqlConnection con;
    private SqlDataReader reader;

    protected void Page_Load(object sender, EventArgs e)
    {
        string imeRacunalnika = "DESKTOP-NS3EVCS";//"localhost";
        string imeRazlicice = "SQLEXPRESS";
        string imeBaze = "RestavracijaAnatra";
        string ukaz = "SELECT ime_artikla,italijansko_ime_art,opis_artilka,kategorija,cena FROM MENI ";
        
        String connectionString = "data source=" + imeRacunalnika + "\\" + imeRazlicice +
                                      "; database=" + imeBaze + "; integrated security=SSPI";

        con = new SqlConnection(connectionString);
        con.Open();




        reader = null;
        try
        {
            SqlCommand cmd = new SqlCommand(ukaz, con);
            reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    string ime_artikla = reader.GetString(0);
                    string ita_ime_art = reader.GetString(1);
                    string opis_artilka = reader.GetString(2);
                    string kategorija = reader.GetString(3);
                    decimal cena = reader.GetSqlMoney(4).ToDecimal();

                    switch(kategorija)
                    {
                        case "Predjedi":
                            predjedi.InnerHtml += ItemVMeni(ime_artikla, ita_ime_art, opis_artilka, cena);
                            break;
                        case "Zacetna jed":
                            zacetneJedi.InnerHtml += ItemVMeni(ime_artikla, ita_ime_art, opis_artilka, cena);
                            break;
                        case "Glavna jed":
                            glavneJedi.InnerHtml += ItemVMeni(ime_artikla, ita_ime_art, opis_artilka, cena);
                            break;
                        case "Sladice":
                            sladice.InnerHtml += ItemVMeni(ime_artikla, ita_ime_art, opis_artilka, cena);
                            break;
                        case "Rdeca vina":
                            rdecaVina.InnerHtml += ItemVMeni(ime_artikla, ita_ime_art, opis_artilka, cena);
                            break;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            
        }
        finally {con.Close();}        
    }


    private string ItemVMeni(string ImeArtikl, string ItaImeArt, string opisArtikla, decimal cena)
    {
        cena = decimal.Round(cena, 2);

        string HTML =
            "<div class=\"menu-item\">" +
                "<div class=\"menu-item-name\">" +
                    ImeArtikl + "<br>" + ItaImeArt +
                "</div>" +

                "<div class=\"menu-item-price\">" +
                    cena +                              //Tukaj ni znaka za euro, saj to kupce spodbudi k varčevanju z denarjem in pazenjem na ceno
                "</div>" +

                "<div class=\"menu-item-description\">" +
                    opisArtikla +
                "</div>" +
            "</div>";                      
        
        return HTML;
    }    
}