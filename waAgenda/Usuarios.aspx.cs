using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace waAgenda
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSourceUsuarios_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if(e.Exception != null)
            {
                lblMsg.Text = "Inserindo um registro duplicado ou com campos em branco. Verifique!";
                e.ExceptionHandled = true;
            }
        }

        protected void SqlDataSourceUsuarios_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                lblMsg.Text = "Alterando um registro sem informar os campos. Verifique!";
                e.ExceptionHandled = true;
            }
        }
    }
}