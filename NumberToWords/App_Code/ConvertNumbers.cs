using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ConvertNumbers
/// </summary>
public class ConvertNumbers
{
    public int Id;
    public string PersonName;
    public string OrignalNumber;
    public string ConvertedNumber;

	public ConvertNumbers()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int Insert()
    {
        //string connectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Haroon Asgher\Desktop\NumberToWord\NumberToWords\App_Data\NumberToWord.mdf;Integrated Security=True";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["NTWConnectionString"].ToString());
        con.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        string query = "INSERT INTO ConvertNumber(PersonName,OrginalNumber,ConvertedNumber) VALUES (@PersonName,@OrginalNumber,@ConvertedNumber)";
        cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@PersonName", PersonName);
        cmd.Parameters.AddWithValue("@OrginalNumber", OrignalNumber);
        cmd.Parameters.AddWithValue("@ConvertedNumber", ConvertedNumber);

        int i = cmd.ExecuteNonQuery();

        con.Close();

        return i;
    }
}