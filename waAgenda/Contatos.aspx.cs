using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace waAgenda
{
    public partial class Contatos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {

            try
            {
                if (tbEmail.Text != "" && tbNome.Text != "" && tbTelefone.Text != "")
                {

                    //Capturar a string de conexão
                    System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/MyWebSiteRoot");
                    System.Configuration.ConnectionStringSettings connString;
                    connString = rootWebConfig.ConnectionStrings.ConnectionStrings["ConnectionString"];

                    //criar um objeto de conexão
                    SqlConnection con = new SqlConnection();
                    con.ConnectionString = connString.ToString();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "Insert into contato (Nome,Email,Telefone) values (@Nome,@Email,@Telefone)";
                    cmd.Parameters.AddWithValue("Nome", tbNome.Text);
                    cmd.Parameters.AddWithValue("Email", tbEmail.Text);
                    cmd.Parameters.AddWithValue("Telefone", tbTelefone.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                }
                else
                {
                    throw new Exception("Campos em branco");
                }
            }
            catch (Exception erro)
            {
                Response.Write("<script> alert('" + erro.Message + "'); </script>");
            }
            finally
            {
                //Limpando os campos apos inserir
                tbNome.Text = "";
                tbEmail.Text = "";
                tbTelefone.Text = "";
            }

         
        }
    }
}