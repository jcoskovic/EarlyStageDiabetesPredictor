using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestSharp;
using Newtonsoft.Json.Linq;

namespace RUAP_EarlyStageDiabetesPredictor
{
    public partial class DiabetesPredictor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbPredict_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtAge.Text) || string.IsNullOrEmpty(rblGender.SelectedValue) || string.IsNullOrEmpty(rblPolyuria.SelectedValue) || string.IsNullOrEmpty(RblPolydipsia.SelectedValue) || string.IsNullOrEmpty(RblWeight.SelectedValue) || string.IsNullOrEmpty(RblWeakness.SelectedValue) || string.IsNullOrEmpty(RblPolyphagia.SelectedValue) || string.IsNullOrEmpty(RblGenital.SelectedValue) || string.IsNullOrEmpty(RblBlurring.SelectedValue) || string.IsNullOrEmpty(RblItching.SelectedValue) || string.IsNullOrEmpty(RblIrritability.SelectedValue) || string.IsNullOrEmpty(RblDelHealing.SelectedValue) || string.IsNullOrEmpty(RblPartParesis.SelectedValue) || string.IsNullOrEmpty(RblMuscleStiff.SelectedValue) || string.IsNullOrEmpty(RblAlopecia.SelectedValue) || string.IsNullOrEmpty(RblObesity.SelectedValue))
            {
                lblResults.Text = "You must enter all values";
                return;
            }
            else
            {
                var client = new RestClient("https://ussouthcentral.services.azureml.net/workspaces/f5f9c4ab9919472595b19e81731388a2/services/929de68d7fc44a94bf6c477eab3bc9ee/execute?api-version=2.0&details=true");
                client.Timeout = -1;
                var request = new RestRequest(Method.POST);
                request.AddHeader("Authorization", "Bearer 3rwjpPKuQtuWH4aGWuKpAnLmJzP07+ILCUFn0LJkVrL6DovzgL7c6cVz2nUOemiuvjUHWMHZ4RP8+AMCLIWwsA==");
                request.AddHeader("Content-Type", "application/json");

                double ageValue = double.Parse(txtAge.Text);
                int polyuriaValue = rblPolyuria.SelectedItem.Text == "Yes" ? 1 : 0;
                int polydipsiaValue = RblPolydipsia.SelectedItem.Text == "Yes" ? 1 : 0;
                int suddenWeightLossValue = RblWeight.SelectedItem.Text == "Yes" ? 1 : 0;
                int weaknessValue = RblWeakness.SelectedItem.Text == "Yes" ? 1 : 0;
                int polyphagiaValue = RblPolyphagia.SelectedItem.Text == "Yes" ? 1 : 0; 
                int genitalThrushValue = RblGenital.SelectedItem.Text == "Yes" ? 1 : 0; 
                int visualBlurringValue = RblBlurring.SelectedItem.Text  == "Yes" ? 1 : 0;
                int itchingValue = RblItching.SelectedItem.Text == "Yes" ? 1 : 0;
                int irritabilityValue = RblIrritability.SelectedItem.Text == "Yes" ? 1 : 0;
                int delayedHealingValue = RblDelHealing.SelectedItem.Text == "Yes" ? 1 : 0;
                int partialParesisValue = RblPartParesis.SelectedItem.Text == "Yes" ? 1 : 0;
                int muscleStiffnessValue = RblMuscleStiff.SelectedItem.Text == "Yes" ? 1 : 0;
                int alopeciaValue = RblAlopecia.SelectedItem.Text == "Yes" ? 1 : 0;
                int obesityValue = RblObesity.SelectedItem.Text == "Yes" ? 1 : 0;
                string genderValue = rblGender.SelectedItem.Text;


                var body = @"{
    ""Inputs"": {
        ""input1"": {
            ""ColumnNames"": [
                ""Age"",
                ""Gender"",
                ""Polyuria"",
                ""Polydipsia"",
                ""sudden weight loss"",
                ""weakness"",
                ""Polyphagia"",
                ""Genital thrush"",
                ""visual blurring"",
                ""Itching"",
                ""Irritability"",
                ""delayed healing"",
                ""partial paresis"",
                ""muscle stiffness"",
                ""Alopecia"",
                ""Obesity"",
                ""class""
            ],
            ""Values"": [
                [
                    " + ageValue + @",
                    """ + genderValue + @""",
                    " + polyuriaValue + @",
                    " + polydipsiaValue + @",
                    " + suddenWeightLossValue + @",
                    " + weaknessValue + @",
                    " + polyphagiaValue + @",
                    " + genitalThrushValue + @",
                    " + visualBlurringValue + @",
                    " + itchingValue + @",
                    " + irritabilityValue + @",
                    " + delayedHealingValue + @",
                    " + partialParesisValue + @",
                    " + muscleStiffnessValue + @",
                    " + alopeciaValue + @",
                    " + obesityValue + @",
                    ""?""
                ]
            ]
        }
    },
    ""GlobalParameters"": {}
}";





                request.AddParameter("application/json", body, ParameterType.RequestBody);
                IRestResponse response = client.Execute(request);
                

                Console.WriteLine(response);
                JObject obj = JObject.Parse(response.Content);
                JArray values = (JArray)obj["Results"]["output1"]["value"]["Values"][0];
                string scoredLabels = (string)values[17];


                if (scoredLabels == "Positive")
                {
                    lblResults.Text = "Scored Labels: " + scoredLabels + "<br />" + "You should visit your doctor";
                }

                else if (scoredLabels == "Negative")
                {
                    lblResults.Text = "Scored Labels: " + scoredLabels + "<br />" + "Your results are showing that you don't have early stage diabetes";
                }
            }
        }
    }
}