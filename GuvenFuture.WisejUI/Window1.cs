
using System;
using System.Xml.Linq;
using Newtonsoft.Json.Linq;
using RestSharp;
using Wisej.Web;

namespace GuvenFuture.WisejUI
{
    public partial class Window1 : Form
    {
        public Window1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var client = new RestClient("https://localhost:7064/");
            var request = new RestRequest("api/AppointmentAction/GetAll", Method.Get);
            RestResponse res = client.Execute(request);
            if (res != null)
            {
                AlertBox.Show(res.Content);
                dynamic ds = JObject.Parse(res.Content);
                dataGridView1.DataSource = ds.resultData;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int Id = 2;
            var client = new RestClient("https://localhost:7064/");
            var request = new RestRequest($"api/AppointmentAction/GetById/{Id}", Method.Get);
            RestResponse res = client.Execute(request);
            if (res != null)
            {
                AlertBox.Show(res.Content);
                dynamic ds = JObject.Parse(res.Content);
                dataGridView1.DataSource = ds.resultData;
            }
        }
    }
}
