using System;
using System.Web.UI;
using MySql.Data.MySqlClient;

namespace hotelclient
{
    public partial class _Default : Page
    {
        //public int dateSelector = 0;
        public DateTime[] selectedDates = new DateTime[2];

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Calendar1_OnDayRender(object Sender, System.Web.UI.WebControls.DayRenderEventArgs e)
        {
            for (int i = 0; i < selectedDates.Length; i++)
            {
                if (Convert.ToDateTime(Session["checkout"]) >= e.Day.Date && e.Day.Date >= Convert.ToDateTime(Session["checkin"]))
                {
                    e.Cell.BackColor = System.Drawing.Color.Gray;
                }
            }
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

            //TextBox3.Text = (Calendar1.SelectedDate.ToShortDateString()).ToString();
            if (Session["checkout"] != null)
            {
                DateTime date = Convert.ToDateTime(Session["checkout"]);
                TextBox2.Text = date.ToShortDateString();
                System.Diagnostics.Debug.WriteLine(TextBox3.Text);
            }

            if (Session["checkin"] != null)
            {
                DateTime date = Convert.ToDateTime(Session["checkin"]);
                TextBox3.Text = date.ToShortDateString();
            }

            //TextBox2.Text = Convert.ToDateTime(Session["checkout"]).ToString();

            //Calendar1.TodayDayStyle.ForeColor = System.Drawing.Color.Blue;
            //System.Diagnostics.Debug.WriteLine(Session["email"]);
        }

        //https://www.zipwise.com/webservices/radius.php?key=kscqwdb7spbeewde&zip=15522&radius=30&format=json

        protected void Calendar_1_on_load(object sender, EventArgs e)
        {
        }

        protected void calendar_2_on_load(object sender, EventArgs e)
        {
        }

        protected void check_availablity_Click(object sender, EventArgs e)
        {

           
            get_hotel_availability(TextBox3.Text, Convert.ToDateTime(Session["checkin"]), Convert.ToDateTime(Session["checkout"]));
            
        }

        protected void get_hotel_availability(string zipcode, DateTime checkin, DateTime checkout)
        {
            
            string connStr = "server=localhost;user=root;database=hotel_sys;port=3306;password=fonz";
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

        }

    }
}