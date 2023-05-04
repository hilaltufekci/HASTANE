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
    public partial class HastaBilgi : Form
    {
        public HastaBilgi()
        {
            InitializeComponent();
        }
        HastaneEntities4 baglan = new HastaneEntities4();
        private void button1_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = baglan.HastaBilgisiListele().ToList();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            HastaBilgileri save = new HastaBilgileri();
            save.Teshis  = textBox1.Text;
            save.MUcret = Convert.ToInt32(textBox2.Text);
            save.Recete = textBox3.Text;
            save.TakipDurum = textBox4.Text;
            save.HastaNo = Convert.ToInt32(textBox5.Text);
            baglan.HastaBilgileriEkle(save.Teshis , save.MUcret , save.Recete ,save.TakipDurum,save.HastaNo );
            dataGridView1.DataSource = baglan.HastaBilgisiListele().ToList();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int BilgiNo = Convert.ToInt32(textBox1.Tag);
            HastaBilgileri yenile = new HastaBilgileri();
            yenile.Teshis  = textBox1.Text;
            yenile.MUcret = Convert.ToInt32 (textBox2.Text);
            yenile.Recete  = textBox3.Text;
            yenile.TakipDurum   = textBox4.Text;
            yenile.HastaNo = Convert.ToInt32(textBox5.Text);
            baglan.HastaBilgileriYenile(BilgiNo, yenile.Teshis, yenile.MUcret , yenile.Recete ,yenile.TakipDurum,yenile.HastaNo );
            dataGridView1.DataSource = baglan.HastaBilgisiListele().ToList();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            int BilgiNo = Convert.ToInt32(textBox1.Tag);
            baglan.HastaBilgileriSil(BilgiNo);
            dataGridView1.DataSource = baglan.HastaBilgisiListele().ToList();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Tag = satir.Cells["BilgiNo"].Value.ToString();
            textBox1.Text = satir.Cells["Teshis"].Value.ToString();
            textBox2.Text = satir.Cells["MUcret"].Value.ToString();
            textBox3.Text = satir.Cells["Recete"].Value.ToString();
            textBox4.Text = satir.Cells["TakipDurum"].Value.ToString();
            textBox5.Text = satir.Cells["HastaNo"].Value.ToString();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Sekmeler go = new Sekmeler();
            go.Show();
            this.Hide();
        }
    }
}
