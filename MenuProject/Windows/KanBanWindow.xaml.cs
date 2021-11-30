using MenuProject.EF;
using MenuProject.Util;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
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
    /// Логика взаимодействия для KanBanSample.xaml
    /// </summary>
    public partial class KanBanWindow : Window
    {
        List<string> times = new List<string>
            {
                "00:00","01:00","02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00",
                "12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00",
            };

        Point startPosition;
        ObservableCollection<EF.Task> tasks = new ObservableCollection<EF.Task>();

        public KanBanWindow()
        {
            InitializeComponent();

            InitKanBan();
            LoadTasksFromDB();
            TaskLB.ItemsSource = tasks;
        }

        /// <summary>
        /// Загружает задачи из базы данных
        /// </summary>
        private void LoadTasksFromDB()
        {
            tasks.Clear();
            Db.Context.Task
                .Where(r => !r.DateOfCompletion.HasValue)
                .ToList()
                .ForEach(r => tasks.Add(r));      
        }

        /// <summary>
        /// объявление Канбана
        /// </summary>
        private void InitKanBan()
        {
            #region объявление столбца с временем
            var outerItemsList = new List<KanBanSampleOuterItem>();
            var innerItemsListWithTime = new List<KanBanSampleInnerItem>();

            foreach (var time in times)
            {
                innerItemsListWithTime.Add(new KanBanSampleInnerItem(time));
            }

            outerItemsList.Add(new KanBanSampleOuterItem
            {
                DisplayName = "Время",
                Items = innerItemsListWithTime
            });
            #endregion

            #region объявление столбцов с задачами 
            var doneTasks = Db.Context.Task
                .Where(r => r.DateOfCompletion.HasValue)
                .ToDictionary(r => r.DateOfCompletion);

            for (int i = -14; i <= 14; i++)
            {
                var date = DateTime.Now.AddDays(i);
                var innerItems = new List<KanBanSampleInnerItem>();
                for (int j = 0; j < 24; j++)
                {
                    var dateWithTime = date.Date.AddHours(j);
                    if (doneTasks.ContainsKey(dateWithTime))
                        innerItems.Add(new KanBanSampleInnerItem(doneTasks[dateWithTime]));
                    else
                        innerItems.Add(new KanBanSampleInnerItem("", dateWithTime));
                }

                outerItemsList.Add(new KanBanSampleOuterItem
                {
                    DisplayName = date.ToString("dd.MM.yyyy") + " " + date.GetStringDayOfWeek(),
                    Date = date,
                    Items = innerItems
                });
            }
            #endregion

            DataContext = outerItemsList;
        }

        /// <summary>
        /// Поиск родительского элемента заданного типа
        /// </summary>
        private static T FindAnchestor<T>(DependencyObject current)
    where T : DependencyObject
        {
            do
            {
                if (current is T)
                {
                    return (T)current;
                }
                current = VisualTreeHelper.GetParent(current);
            }
            while (current != null);
            return null;
        }

        private void TaskLB_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            startPosition = e.GetPosition(null);
        }

        private void TaskLB_MouseMove(object sender, MouseEventArgs e)
        {
            Point mousePos = e.GetPosition(null);
            Vector diff = startPosition - mousePos;

            if (e.LeftButton == MouseButtonState.Pressed &&
                (Math.Abs(diff.X) > SystemParameters.MinimumHorizontalDragDistance ||
                       Math.Abs(diff.Y) > SystemParameters.MinimumVerticalDragDistance))
            {
                // Получаем задачу из ListBox
                ListBox listView = sender as ListBox;
                ListBoxItem listBoxItem = FindAnchestor<ListBoxItem>((DependencyObject)e.OriginalSource);
                if (listBoxItem == null) return;           
                                                           
                EF.Task item = (EF.Task)listView.ItemContainerGenerator.ItemFromContainer(listBoxItem);
                if (item == null) return;                  
                
                
                DataObject dragData = new DataObject("Task", item);
                DragDrop.DoDragDrop(listBoxItem, dragData, DragDropEffects.Copy | DragDropEffects.Move);
            }
        }

        private void DropOnDate(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent("Task"))
            {
                Grid listViewItem = FindAnchestor<Grid>((DependencyObject)e.OriginalSource);
                var innerItem = (KanBanSampleInnerItem)listViewItem.DataContext;

                var task = (EF.Task)e.Data.GetData("Task");

                ItemsControl itemsControl = sender as ItemsControl;
                if (listViewItem == null || innerItem.IsReadOnly)
                {
                    e.Effects = DragDropEffects.None;
                    return;
                }

                innerItem.DisplayName = task.Name;
                innerItem.Color = new SolidColorBrush((Color)ColorConverter.ConvertFromString(task.HexColor));

                task.DateOfCompletion = innerItem.ItemDate;
                tasks.Remove(task);

                Db.Context.SaveChanges();
            }
        }

        private void AddClick(object sender, RoutedEventArgs e)
        {
            new AddTaskWindow().ShowDialog();
            LoadTasksFromDB();
        }
    }

    public class KanBanSampleOuterItem
    {
        public string DisplayName { get; set; }
        public DateTime Date { get; set; }

        public List<KanBanSampleInnerItem> Items { get; set; }

        public KanBanSampleOuterItem()
        {
            Items = new List<KanBanSampleInnerItem>();
        }
    }

    public class KanBanSampleInnerItem : INotifyPropertyChanged
    {
        string _diplayName;
        Brush _color = Brushes.White;

        public KanBanSampleInnerItem(string displayName, DateTime itemdate)
        {
            DisplayName = displayName;
            ItemDate = itemdate;
        }

        public KanBanSampleInnerItem(EF.Task task)
        {
            IsReadOnly = true;
            DisplayName = task.Name;
            Color = new SolidColorBrush((Color)ColorConverter.ConvertFromString(task.HexColor));
        }

        public KanBanSampleInnerItem(string displayName)
        {
            DisplayName = displayName;
            IsReadOnly = true;
        }

        public Brush Color 
        {
            get
            {
                return _color;
            }
            set
            {
                _color = value;
                OnPropertyChanged();
            }
        } 

        public bool IsReadOnly { get; set; }


        public DateTime ItemDate { get; set; }
        public string DisplayName
        {
            get
            {
                return _diplayName;
            }

            set
            {
                _diplayName = value;
                OnPropertyChanged();
            }
        }

        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }

        public event PropertyChangedEventHandler PropertyChanged;
    }
}
