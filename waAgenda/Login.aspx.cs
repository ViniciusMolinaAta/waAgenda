using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace waAgenda
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String email = tbEmail.Text;
            String senha = tbSenha.Text;

            //Conexão com o banco
            System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/MyWebSiteRoot");
            System.Configuration.ConnectionStringSettings connString;
            connString = rootWebConfig.ConnectionStrings.ConnectionStrings["ConnectionString"];

            //criar um objeto de conexão
            SqlConnection con = new SqlConnection();
            con.ConnectionString = connString.ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select *from Usuario where Email = @Email and Senha = @Senha";
            cmd.Parameters.AddWithValue("Email", email);
            cmd.Parameters.AddWithValue("Senha", senha);
            con.Open();

            SqlDataReader registro = cmd.ExecuteReader();
            if (registro.HasRows)
            {
                //Direcionar para a pagina principal
                Response.Redirect("~/Index.aspx");
            }
            else
            {
                lblMsg.Text = "E-mail ou senha invalido";
            }





        }
    }
}