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
    public partial class Rapor : Form
    {
        public Rapor()
        {
            InitializeComponent();
        }
        HastaneEntities4 baglan = new HastaneEntities4();
        private void button1_Click(object sender, EventArgs e)
        {
            var query = from hasta in baglan.Hastalars orderby hasta.HastaNo select hasta;
            dataGridView1.DataSource = query.ToList();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var query = from hasta in baglan.HastaBilgileris orderby hasta.Teshis descending select hasta;
            dataGridView1.DataSource = query.ToList();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            var query = baglan.HastaBilgileris.Where(o => o.Teshis == "Depresyon");
            dataGridView1.DataSource = query.ToList();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            var query = baglan.Doktorlars.Where(o => o.Uzmanlık == "Profesör" && o.Brans == "Kardiyoloji");
            dataGridView1.DataSource = query.ToList();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            var query = baglan.HastaBilgileris.Where(o => o.Teshis == "Diyabet" && o.TakipDurum == "Kontrol");
            dataGridView1.DataSource = query.ToList();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            var query = from doktor in baglan.Doktorlars orderby doktor.Brans descending select doktor;
            dataGridView1.DataSource = query.ToList();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            var query = from b in baglan.HastaBilgileris
                        join h in baglan.Hastalars on b.HastaNo equals h.HastaNo
                        join t in baglan.Raporlars on b.HastaNo equals t.HastaNo
                        select new
                        {
                            h.AdSoyad,
                            h.Yas,
                            b.Teshis,
                            t.RaporTanimi,

                        };
            dataGridView1.DataSource = query.ToList();
        }

        private void button8_Click(object sender, EventArgs e)
        {
            var query = from d in baglan.Doktorlars
                        join r in baglan.Raporlars on d.RaporNo equals r.RaporNo
                        select new
                        {
                            d.AdSoyad,
                            d.Brans,
                            r.RaporNo,
                            r.RaporTanimi,
                        };
            dataGridView1.DataSource = query.ToList();
        }

        private void button9_Click(object sender, EventArgs e)
        {
            Sekmeler go = new Sekmeler();
            go.Show();
            this.Hide();
        }
    }
}
