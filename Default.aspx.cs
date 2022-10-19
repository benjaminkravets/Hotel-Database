using System;
using System.Linq;
using System.Web.UI;
using MySql.Data.MySqlClient;
using System.Collections.Generic;

namespace hotelclient
{
    public partial class _Default : Page
    {
        public int dateSelector = 0;
        public DateTime[] selectedDates = new DateTime[2];
        protected void gas()
        {
            // Storing email to Session variable
            Session["email"] = Calendar1.SelectedDate;
            


            // Checking Session variable is not empty
            if (Session["email"] != null)
            {
                // Displaying stored email
                //Label3.Text = "This email is stored to the session.";
                //Label4.Text = Session["email"].ToString();
            }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
            
        }

        protected void Calendar1_OnDayRender(object Sender, System.Web.UI.WebControls.DayRenderEventArgs e)
        {
            for (int i = 0; i < selectedDates.Length; i++)
            {
               
               // if (e.Day.Date.CompareTo(Session["checkin"]) == 0 || 
                //    e.Day.Date.CompareTo(Session["checkout"]) == 0)
                if (Convert.ToDateTime(Session["checkout"]) > e.Day.Date && e.Day.Date > Convert.ToDateTime(Session["checkin"])) 
                {
                    e.Cell.BackColor = System.Drawing.Color.DarkGreen;
                }
            }
            //System.Diagnostics.Debug.WriteLine(selectedDates.Length);
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            

            if (Session["index"] == null)
            {
                Session["index"] = 0;
            }
            else if (Convert.ToInt32(Session["index"]) == 0)
            {
                Session["index"] = (Convert.ToInt32(Session["index"]) + 1);
            }
            else
            {
                Session["index"] = (Convert.ToInt32(Session["index"]) - 1);
            }
            System.Diagnostics.Debug.WriteLine(Session["index"]);

            if (Convert.ToInt32(Session["index"]) == 0)
            {
                Session["checkin"] = Calendar1.SelectedDate;
                
            }
            else
            {
                Session["checkout"] = Calendar1.SelectedDate;
            }

            if (Convert.ToDateTime(Session["checkout"]) < Convert.ToDateTime(Session["checkin"]) && Session["checkin"] != null && Session["checkout"] != null)
            {
                System.Diagnostics.Debug.WriteLine("naeu");
                Session["temp"] = Session["checkin"];
                Session["checkin"] = Session["checkout"];
                Session["checkout"] = Session["temp"];
                
            }
                    



            TextBox3.Text = (Calendar1.SelectedDate.ToShortDateString()).ToString();
            
            

            //Calendar1.TodayDayStyle.ForeColor = System.Drawing.Color.Blue;
            //System.Diagnostics.Debug.WriteLine(Session["email"]);
            
            


            return;

            string connStr = "server=localhost;user=root;database=world;port=3306;password=fonz";
            MySqlConnection conn = new MySqlConnection(connStr);
            try
            {
                Console.WriteLine("Connecting to MySQL...");
                conn.Open();

                string sql = "select ID from city where ID < 10";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    //Console.WriteLine(rdr[0] + " -- " + rdr[1]);
                    System.Diagnostics.Debug.WriteLine(rdr[0]);

                    TextBox3.Text = rdr[0].ToString();
                }
                rdr.Close();
            }
            catch (Exception ex)
            {
                //Console.WriteLine(ex.ToString());
                System.Diagnostics.Debug.WriteLine(ex.ToString());
            }

            conn.Close();
            Console.WriteLine("Done.");
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            TextBox2.Text = (Calendar2.SelectedDate.ToShortDateString()).ToString();

            //https://www.zipwise.com/webservices/radius.php?key=kscqwdb7spbeewde&zip=15522&radius=30&format=json
        }

        protected void check_availability_Click(object sender, EventArgs e)
        {
        }

        protected void Calendar_1_on_load(object sender, EventArgs e)
        {
        }

        protected void calendar_2_on_load(object sender, EventArgs e)
        {
        }
    }
}