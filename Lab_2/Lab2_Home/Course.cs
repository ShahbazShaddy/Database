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
    public partial class Course : Form
    {
        public Course()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("Select * from Course", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
            cmd.ExecuteNonQuery();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("Insert into Course values (@Course_ID, @Course_Name, @Student_Name, @Teacher_Name, @Semester)", con);
            cmd.Parameters.AddWithValue("@Course_ID", textBox1.Text);
            cmd.Parameters.AddWithValue("@Course_Name", textBox2.Text);
            cmd.Parameters.AddWithValue("@Student_Name", textBox3.Text);
            cmd.Parameters.AddWithValue("@Teacher_Name", textBox4.Text);
            cmd.Parameters.AddWithValue("@Semester", textBox5.Text);
            cmd.ExecuteNonQuery();
            MessageBox.Show("Successfully saved");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("Update Course SET Course_ID = @Course_ID , Course_Name = @Course_Name , Student_Name = @Student_Name, Teacher_Name = @Teacher_Name, Semester = @Semester where Course_ID = @Course_ID", con);
            cmd.Parameters.AddWithValue("@Course_ID", textBox1.Text);
            cmd.Parameters.AddWithValue("@Course_Name", textBox2.Text);
            cmd.Parameters.AddWithValue("@Student_Name", textBox3.Text);
            cmd.Parameters.AddWithValue("@Teacher_Name", textBox4.Text);
            cmd.Parameters.AddWithValue("@Semester", textBox5.Text);
            cmd.ExecuteNonQuery();
            MessageBox.Show("Update successfully");
        }

        private void button4_Click(object sender, EventArgs e)
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("DELETE FROM Course WHERE Course_ID = @Course_ID AND Course_Name = @Course_Name AND Student_Name = @Student_Name AND Teacher_Name = @Teacher_Name AND Semester = @Semester", con);
            cmd.Parameters.AddWithValue("@Course_ID", textBox1.Text);
            cmd.Parameters.AddWithValue("@Course_Name", textBox2.Text);
            cmd.Parameters.AddWithValue("@Student_Name", textBox3.Text);
            cmd.Parameters.AddWithValue("@Teacher_Name", textBox4.Text);
            cmd.Parameters.AddWithValue("@Semester", textBox5.Text);
            cmd.ExecuteNonQuery();
            MessageBox.Show("Deleted successfully");
        }

        private void button5_Click(object sender, EventArgs e)
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("SELECT Course_ID, Course_Name, Student_Name, Teacher_Name, Semester FROM Course WHERE Course_ID = @Course_ID", con);
            cmd.Parameters.AddWithValue("@Course_ID", textBox6.Text);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                textBox1.Text = reader["Course_ID"].ToString();
                textBox2.Text = reader["Course_Name"].ToString();
                textBox3.Text = reader["Student_Name"].ToString();
                textBox4.Text = reader["Teacher_Name"].ToString();
                textBox5.Text = reader["Semester"].ToString();
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
