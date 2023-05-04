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
    public partial class Doktor : Form
    {
        public Doktor()
        {
            InitializeComponent();
        }
        HastaneEntities4 baglan = new HastaneEntities4();
        private void button1_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = baglan.DoktorListele().ToList();
        
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Doktorlar save = new Doktorlar ();
            save.AdSoyad  = textBox1.Text;
            save.Brans  = textBox2.Text;
            save.Uzmanlık  = textBox3.Text;
            save.RaporNo  = Convert.ToInt32 ( textBox4.Text);
            baglan.DoktorEkle(save.AdSoyad ,save.Brans , save.Uzmanlık ,save.RaporNo );
            dataGridView1.DataSource = baglan.DoktorListele().ToList();

        }

        private void button3_Click(object sender, EventArgs e)
        {
            int DoktorNo = Convert.ToInt32(textBox1.Tag);
            Doktorlar yenile = new Doktorlar();
            yenile.AdSoyad  = textBox1.Text;
            yenile.Brans  = textBox2.Text;
            yenile.Uzmanlık  = textBox3.Text;
            yenile.RaporNo  = Convert.ToInt32(textBox4.Text);
            baglan.DoktorYenile (DoktorNo , yenile.AdSoyad , yenile.Brans , yenile.Uzmanlık , yenile.RaporNo );
            dataGridView1.DataSource = baglan.DoktorListele().ToList();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            int DoktorNo = Convert.ToInt32(textBox1.Tag);
            baglan.DoktorSil(DoktorNo);
            dataGridView1.DataSource = baglan.DoktorListele().ToList();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Tag = satir.Cells["DoktorNo"].Value.ToString();
            textBox1.Text = satir.Cells["AdSoyad"].Value.ToString();
            textBox2.Text = satir.Cells["Brans"].Value.ToString();
            textBox3.Text = satir.Cells["Uzmanlık"].Value.ToString();
            textBox4.Text = satir.Cells["RaporNo"].Value.ToString();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Sekmeler go = new Sekmeler();
            go.Show();
            this.Hide();

        }
    }
    }

