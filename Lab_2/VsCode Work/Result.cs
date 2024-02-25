using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Lab2_Home
{
    public partial class Result : Form
    {
        public Result()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("Select * from Result", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
            cmd.ExecuteNonQuery();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("Update Result SET Student_ID = @Student_ID , Course_Name = @Course_Name , Marks = @Marks, Grade = @Grade, Section = @Section where Student_ID = @Student_ID AND Course_Name = @Course_Name", con);
            cmd.Parameters.AddWithValue("@Student_ID", textBox1.Text);
            cmd.Parameters.AddWithValue("@Course_Name", textBox2.Text);
            cmd.Parameters.AddWithValue("@Marks", textBox3.Text);
            cmd.Parameters.AddWithValue("@Grade", textBox4.Text);
            cmd.Parameters.AddWithValue("@Section", textBox5.Text);
            cmd.ExecuteNonQuery();
            MessageBox.Show("Update successfully");
        }

        private void button5_Click(object sender, EventArgs e)
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("SELECT Student_ID, Course_Name, Marks, Grade, Section FROM Result WHERE Student_ID = @Student_ID", con);
            cmd.Parameters.AddWithValue("@Student_ID", textBox6.Text);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                textBox1.Text = reader["Student_ID"].ToString();
                textBox2.Text = reader["Course_Name"].ToString();
                textBox3.Text = reader["Marks"].ToString();
                textBox4.Text = reader["Grade"].ToString();
                textBox5.Text = reader["Section"].ToString();
            }
            else
            {
                MessageBox.Show("Student not found");
            }

            reader.Close();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Form2 form2 = new Form2();
            this.Hide();
            form2.Show();
        }
    }
}
