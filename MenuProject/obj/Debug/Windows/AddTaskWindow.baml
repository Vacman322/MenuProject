   M S B A M L   `   `   `  ����F  BMenuProject, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:MenuProject.WindowsMenuProject.Windows  5   	   '    !MenuProject.Windows.AddTaskWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   3local!clr-namespace:MenuProject.Windows     5   	   $	��450��5   	   $	��800��5	   	   .��5
      � $��10q�6     � RowDefinitions  5   
   �� 5      $��2* �6   $��50��5      �� 5      �� 5      �� 5      �� 5      $��8* �6   $��50��5       � ColumnDefinitions 5   
   �� 5      $
��0.7* �6   �� 5      .+�5   
   �� $'��!Добавление задачи��6   $��10��5      $��Center=�5      $��Center=�5      $��20(�5       �� 5#   
   $��Название:��6   $��Center=�5$      $��Right=�5%      $��1��5&      $
��10,0q�5'      �� 5)   
   $��	Цвет:��6   $��Center=�5*      $��Right=�5+      $��2��5,      $
��10,0q�5-      �� 50   
   $��1��51      $��1��52      $��Center=�53      $
��10,0q�54      ��50      �� *Name+ �� Mode$ TwoWay=�54      �� 56   
   -   5        $��ColorTB��58      $��2��57      $
��10,0q�5:      |�.  $��1��5<      $��Center=�5=       �� 	MaxLength$ 6��5>      ��56      �� *Color+$ TwoWay=�5>      �� 5A   
   -   5        $��Добавить��5A      $��3��5C      $��10��5D      $��Center=�5E      $��Center=�5F      5H      5I      