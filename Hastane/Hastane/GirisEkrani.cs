using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Hastane
{
    public partial class GirisEkrani : Form
    {
        public GirisEkrani()
        {
            InitializeComponent();
        }
        HastaneEntities4 baglan = new HastaneEntities4();
        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            groupBox2.Visible = true;
        }

        private void GirisEkrani_Load(object sender, EventArgs e)
        {
            groupBox2.Visible = false;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Sekmeler go = new Sekmeler();
            go.Show();
            this.Hide();

        }
        public bool GirisYap(string ad, string sifre)
        { 
            var query = from p in baglan.Kullanicilars where p.KullaniciAdi == ad && p.Sifre == sifre select p;
            if (query.Any())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        private void button1_Click(object sender, EventArgs e)
        {
                if (GirisYap(textBox1.Text, textBox2.Text))
                {
                    MessageBox.Show("Giriş Yap...");
                }
                else
                {
                    MessageBox.Show("Başarısız...");
                }
         }
    }
}
