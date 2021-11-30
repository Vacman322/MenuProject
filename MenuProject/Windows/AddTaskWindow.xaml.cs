using MenuProject.EF;
using MenuProject.Util;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace MenuProject.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddTaskWindow.xaml
    /// </summary>
    public partial class AddTaskWindow : Window
    {
        EF.Task _task = new EF.Task();
        public AddTaskWindow()
        {
            InitializeComponent();
            this.DataContext = _task;
        }

        private void SaveClick(object sender, RoutedEventArgs e)
        {
            Db.Context.Task.Add(_task);
            try
            {
                Db.Context.SaveChanges();

                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при сохранении\n\n {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void ColorPickClick(object sender, MouseButtonEventArgs e)
        {
            var dialog = new System.Windows.Forms.ColorDialog();
            var result = dialog.ShowDialog();
            if(result == System.Windows.Forms.DialogResult.OK)
            {
                var color = dialog.Color;
                ColorTB.Text = color.ToHexString();
                _task.Color = color.ToHexString().Substring(1, 6);
            }
        }
    }
}
