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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        HastaneEntities4 baglan = new HastaneEntities4();
        private void button1_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = baglan.HastaListele().ToList();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Hastalar save = new Hastalar();
            save.AdSoyad = textBox1.Text;
            save.Yas = Convert.ToInt32(textBox2.Text);
            save.Adres = textBox3.Text;
            baglan.HastaEkle(save.AdSoyad, save.Yas, save.Adres);
            dataGridView1.DataSource = baglan.HastaListele().ToList();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int HastaNo = Convert.ToInt32(textBox1.Tag);
            Hastalar yenile = new Hastalar();
            yenile.AdSoyad = textBox1.Text;
            yenile.Yas = Convert.ToInt32(textBox2.Text);
            yenile.Adres = textBox3.Text;
            baglan.HastaYenile(HastaNo, yenile.AdSoyad, yenile.Yas, yenile.Adres);
            dataGridView1.DataSource = baglan.HastaListele().ToList();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Tag = satir.Cells["HastaNo"].Value.ToString();
            textBox1.Text = satir.Cells["AdSoyad"].Value.ToString();
            textBox2.Text = satir.Cells["Yas"].Value.ToString();
            textBox3.Text = satir.Cells["Adres"].Value.ToString();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            int HastaNo = Convert.ToInt32(textBox1.Tag);
            baglan.HastaSil(HastaNo);
            dataGridView1.DataSource = baglan.HastaListele().ToList();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Sekmeler go = new Sekmeler();
            go.Show();
            this.Hide();
        }
    }
}
