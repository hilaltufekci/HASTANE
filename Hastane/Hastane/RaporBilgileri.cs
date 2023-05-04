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
    public partial class RaporBilgileri : Form
    {
        public RaporBilgileri()
        {
            InitializeComponent();
        }
        HastaneEntities4 baglan = new HastaneEntities4();
        private void button1_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = baglan.RaporListele().ToList();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Raporlar save = new Raporlar();
            save.RaporTanimi  = textBox1.Text;
            save.OlusturmaTarihi = textBox2.Text;
            save.SonTarihi = textBox3.Text;
            save.HastaNo = Convert.ToInt32( textBox4.Text);
            baglan.RaporEkle(save.RaporTanimi, save.OlusturmaTarihi, save.SonTarihi, save.HastaNo);
            dataGridView1.DataSource = baglan.RaporListele().ToList();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int RaporNo = Convert.ToInt32(textBox1.Tag);
            Raporlar yenile = new Raporlar();
            yenile.RaporTanimi = textBox1.Text;
            yenile.OlusturmaTarihi = textBox2.Text;
            yenile.SonTarihi = textBox3.Text;
            yenile.HastaNo = Convert.ToInt32(textBox4.Text);
            baglan.RaporYenile(RaporNo, yenile.RaporTanimi, yenile.OlusturmaTarihi, yenile.SonTarihi , yenile.HastaNo);
            dataGridView1.DataSource = baglan.RaporListele().ToList();

        }

        private void button4_Click(object sender, EventArgs e)
        {
            int RaporNo = Convert.ToInt32(textBox1.Tag);
            baglan.RaporSil(RaporNo);
            dataGridView1.DataSource = baglan.RaporListele().ToList();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Tag = satir.Cells["RaporNo"].Value.ToString();
            textBox1.Text = satir.Cells["RaporTanimi"].Value.ToString();
            textBox2.Text = satir.Cells["OlusturmaTarihi"].Value.ToString();
            textBox3.Text = satir.Cells["SonTarihi"].Value.ToString();
            textBox4.Text = satir.Cells["HastaNo"].Value.ToString();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Sekmeler go = new Sekmeler();
            go.Show();
            this.Hide();
        }
    }
}
