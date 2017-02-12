using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dbfirst_webapplication
{
    public partial class Dbfirst_webform : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

       

        public void BindGrid()
        {
            using (dbfirst_databaseEntities context = new dbfirst_databaseEntities())
            {
                var person_intro = context.Introes.Select(a => new
                    {
                        ID = a.ID,
                        FirstName = a.FirstName,
                        LastName = a.LastName,
                        Age = a.Age,
                        Gender = a.Gender,
                        Email = a.Email,
                        PhoneNumber = a.PhoneNumber
                    }).OrderBy(b => b.FirstName).ThenBy(c => c.LastName);

                if (person_intro != null)
                {                   
                    GridView_intro.DataSource = person_intro.ToList();
                    GridView_intro.DataBind();
                }
                else
                {

                }
                
                
            }
            
        }

        public void ClearControls()
        {
            hdnID.Value = "0";
            txtfname.Text = string.Empty;
            txtlname.Text = string.Empty;
            txtage.Text = string.Empty;
            txtgender.Text = string.Empty;
            txtemail.Text = string.Empty;
            txtphonenumber.Text = string.Empty;
        }




        public void Maleworker()
        {
            using (dbfirst_databaseEntities context = new dbfirst_databaseEntities())
            {
                var person_intro = context.Introes.Select(a => new
                {
                    ID = a.ID,
                    FirstName = a.FirstName,
                    LastName = a.LastName,
                    Age = a.Age,
                    Gender = a.Gender,
                    Email = a.Email,
                    PhoneNumber = a.PhoneNumber
                }).Where(d => d.Gender == "Male").OrderBy(b => b.FirstName).ThenBy(c => c.LastName);

                if (person_intro != null)
                {
                    GridView_intro.DataSource = person_intro.ToList();
                    GridView_intro.DataBind();
                }
                else
                {

                }


            }

        }

        public void Femaleworker()
        {
            using (dbfirst_databaseEntities context = new dbfirst_databaseEntities())
            {
                var person_intro = context.Introes.Select(a => new
                {
                    ID = a.ID,
                    FirstName = a.FirstName,
                    LastName = a.LastName,
                    Age = a.Age,
                    Gender = a.Gender,
                    Email = a.Email,
                    PhoneNumber = a.PhoneNumber
                }).Where(d => d.Gender == "Female").OrderBy(b => b.FirstName).ThenBy(c => c.LastName);

                if (person_intro != null)
                {
                    GridView_intro.DataSource = person_intro.ToList();
                    GridView_intro.DataBind();
                }
                else
                {

                }


            }

        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                using (dbfirst_databaseEntities context = new dbfirst_databaseEntities())
                {
                        Intro obj = new Intro();                    
                        obj.ID = Convert.ToInt64(hdnID.Value);
                        obj.FirstName = txtfname.Text.Trim();
                        obj.LastName = txtlname.Text.Trim();
                        obj.Age = Convert.ToInt16(txtage.Text.Trim());
                        obj.Gender = txtgender.Text.Trim();
                        obj.Email = txtemail.Text.Trim();
                        obj.PhoneNumber = Convert.ToInt64(txtphonenumber.Text.Trim());
                    
                    if(Convert.ToInt64(hdnID.Value) > 0)
                    {
                        context.Introes.Attach(obj);
                        var entry = context.Entry(obj);
                        context.Configuration.ValidateOnSaveEnabled = false;

                        context.Entry(obj).Property(u => u.FirstName).IsModified = true;
                        context.Entry(obj).Property(u => u.LastName).IsModified = true;
                        context.Entry(obj).Property(u => u.Age).IsModified = true;
                        context.Entry(obj).Property(u => u.Gender).IsModified = true;
                        context.Entry(obj).Property(u => u.Email).IsModified = true;
                        context.Entry(obj).Property(u => u.PhoneNumber).IsModified = true;

                        if (context.SaveChanges() > 0)
                        {
                            context.Configuration.ValidateOnSaveEnabled = true;
                            GridView_intro.SelectedIndex = -1;
                            BindGrid();
                            ClearControls();                
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Saved", "<script>alert('Updated successfully.');</script>");
                        }
                        else
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Saved", "<script>alert('Error while updating.');</script>");
                        }
                    }     
                    
                    else
                    {
                        context.Introes.Add(obj);
                        if (context.SaveChanges() > 0)
                        {
                            var intro_ID = obj.ID;
                            GridView_intro.SelectedIndex = -1;
                            BindGrid();
                            ClearControls();
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Saved", "<script>alert('Saved successfully.');</script>");
                        }
                        else
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Saved", "<script>alert('Error while saving.');</script>");
                        }
                    }              
                }
            }
        }

       

        protected void intro_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EDT")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridView_intro.SelectedIndex = rowIndex;
                hdnID.Value = ((HiddenField)GridView_intro.Rows[rowIndex].FindControl("hdnID")).Value;
                txtfname.Text = ((Label)GridView_intro.Rows[rowIndex].FindControl("lblFirstName")).Text;
                txtlname.Text = ((Label)GridView_intro.Rows[rowIndex].FindControl("lblLastName")).Text;
                txtage.Text = ((Label)GridView_intro.Rows[rowIndex].FindControl("lblAge")).Text;
                txtgender.Text = ((Label)GridView_intro.Rows[rowIndex].FindControl("lblGender")).Text;
                txtemail.Text = ((Label)GridView_intro.Rows[rowIndex].FindControl("lblEmail")).Text;
                txtphonenumber.Text = ((Label)GridView_intro.Rows[rowIndex].FindControl("lblPhoneNumber")).Text;               
            }
            else if (e.CommandName == "DLT")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                hdnID.Value = ((HiddenField)GridView_intro.Rows[rowIndex].FindControl("hdnID")).Value;
                using (dbfirst_databaseEntities context = new dbfirst_databaseEntities())
                {
                    Int64 ID = Convert.ToInt64(hdnID.Value);
                    Intro abc = context.Introes.Where(m => m.ID == ID).SingleOrDefault();
                    context.Introes.Remove(abc);
                    if (context.SaveChanges() > 0)
                    {
                        GridView_intro.SelectedIndex = -1;
                        BindGrid();
                        ClearControls();
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Deleted", "<script>alert('Deleted successfully.');</script>");
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Deleted", "<script>alert('Error while deleting.');</script>");
                    }
                }
            }
        }

        protected void RadioButtonList11_SelectedIndexChanged(object sender, EventArgs e)
        {
            dbfirst_databaseEntities context = new dbfirst_databaseEntities();
            switch (RadioButtonList11.SelectedValue)
            {
                case "All":
                    BindGrid();
                    break;

                case "Male":
                    Maleworker();
                    break;

                case "Female":
                    Femaleworker();
                    break;
            }
        }
    }
}