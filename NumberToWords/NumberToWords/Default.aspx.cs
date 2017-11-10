using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NumberToWords_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        NumberToWord objServices = new NumberToWord();
        ConvertNumbers objNumber = new ConvertNumbers();
        try
        {
            bool isNumber = objServices.ValidateNumber(txtNumber.Value);
            bool isName = objServices.ValidateName(txtPersonName.Value);

            if(isNumber)
            {
                if(isName)
                {
                   string ConvertedNumber = objServices.ConvertNumbersToWords(txtNumber.Value.Trim());

                    if(ConvertedNumber.Trim() != "")
                    {
                        objNumber.OrignalNumber = txtNumber.Value.Trim();
                        objNumber.ConvertedNumber = ConvertedNumber;
                        objNumber.PersonName = txtPersonName.Value;

                        int infectedRows = objNumber.Insert();

                        if(infectedRows > 0)
                        {
                            divSuccess.Visible = true;
                            lblSuccess.Text = "Record Add Successfully.";

                            txtNumber.Value = "";
                            txtPersonName.Value = "";
                        }
                        else
                        {
                            divError.Visible = true;
                            lblError.Text = "Failure! Try again.";
                        }
                    }
                    else
                    {
                        divError.Visible = true;
                        lblError.Text = "Invalid Number.";
                    }
                }
                else
                {
                    divError.Visible = true;
                    lblError.Text = "Invalid Name.";
                }
            }
            else
            {
                divError.Visible = true;
                lblError.Text = "Invalid Number.";
            }
        }
        catch(Exception ex)
        {
           divError.Visible = true;
           lblError.Text = ex.Message;
        }
    }
}