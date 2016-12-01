﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;    

namespace Hethongtuyendung
{
    public partial class FrmTuyenDung : Form
    {
        string cnStr;
        SqlConnection cn;
        
        public FrmTuyenDung()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            cnStr = "Server =.; Database = HTTD; Integrated security = true;";
            cn = new SqlConnection(cnStr);
        }
        private void Connect()
        {
            try
            {
                if (cn != null && cn.State == ConnectionState.Open)
                    cn.Open();
            }
            catch (SqlException ex)
            {
                MessageBox.Show("Loi...\n" + ex.Message);
                //throw;
            }
        }
        private void DisConnect()
        {
            if (cn != null && cn.State == ConnectionState.Open)
                cn.Close();
        }
    }
}
