using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Lab2_Home
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void btn_home_Click(object sender, EventArgs e)
        {
            Form1 form1 = new Form1();
            this.Hide();
            form1.Show();
        }

        private void btn_result_Click(object sender, EventArgs e)
        {
            Form3 form3 = new Form3();
            this.Hide();
            form3.Show();
        }

        private void btn_exit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Student form4 = new Student();
            this.Hide();
            form4.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Course course = new Course();
            this.Hide();
            course.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Result result = new Result();
            this.Hide();
            result.Show();
        }
    }
}
