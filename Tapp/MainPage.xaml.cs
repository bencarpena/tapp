using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace Tapp
{
    public partial class MainPage : ContentPage
    {


        public MainPage()
        {
            InitializeComponent();
        }


        void Handle_Clicked(object sender, System.EventArgs e)
        {
            try
            {
                DisplayAlert("Alert", "Go where?", "Huh?", "Nvm");
            }
            catch (Exception ex)
            {
                throw new NotImplementedException();
            }
                


        }


    }
}
