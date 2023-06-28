<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DiabetesPredictor.aspx.cs" Inherits="RUAP_EarlyStageDiabetesPredictor.DiabetesPredictor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Early Stage Diabetes Predictor</title>
<style>
        body {
          font-family: Arial;
          font-size: 16px;
          background-color: #f9f9f9; 
        }
        h1 {
            text-align: center;
        }

        table {
          border-collapse: collapse;
          margin: 0 auto;
          width: 80%;
          table-layout: fixed;
          background-color: #fff;
          border: 1px solid #ddd;
          box-shadow: 0px 2px 3px rgba(0, 0, 0, 0.2); 
          color: #333; 
        }

        th,
        td {
          padding: 10px;
          border: 1px solid #ddd;
          word-wrap: break-word;
           text-align: center;
        }

        th {
          background-color: #4CAF50;
          color: #fff;
          text-align: left; 
          font-weight: bold;
        }

        tr:nth-child(even) {
          background-color: #f2f2f2; 
        }

        tr:hover {
          background-color: #ddd; 
        }
        #lbPredict{
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            cursor: pointer;
        }
        #lbPredict:hover{
            background-color: #3e8e41;
        }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Enter neccesary data below</h1>
        </div>
        <table>
            <tr>
                <td>Age:</td>
                <td>
                    <asp:TextBox ID="txtAge" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Gender:</td>
                <td>
                    <asp:RadioButtonList ID="rblGender" runat="server">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td>Polyuria:</td>
                <td>
                    <asp:RadioButtonList ID="rblPolyuria" runat="server">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td>Polydipsia:</td>
                <td>
                    <asp:RadioButtonList ID="RblPolydipsia" runat="server">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td>Sudden Weight Loss:</td>
                <td>
                    <asp:RadioButtonList ID="RblWeight" runat="server">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td>Weakness:</td>
                <td>
                    <asp:RadioButtonList ID="RblWeakness" runat="server">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td>Polyphagia:</td>
                <td>
                    <asp:RadioButtonList ID="RblPolyphagia" runat="server">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td>Genital Thrush:</td>
                <td>
                    <asp:RadioButtonList ID="RblGenital" runat="server">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td>Visual Blurring:</td>
                <td>
                    <asp:RadioButtonList ID="RblBlurring" runat="server">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td>Itching:</td>
                <td>
                    <asp:RadioButtonList ID="RblItching" runat="server">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td>Irritability:</td>
                <td>
                    <asp:RadioButtonList ID="RblIrritability" runat="server">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td>Delayed Healing:</td>
                <td>
                    <asp:RadioButtonList ID="RblDelHealing" runat="server">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td>Partial Paresis:</td>
                <td>
                    <asp:RadioButtonList ID="RblPartParesis" runat="server">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td>Muscle Stiffness:</td>
                <td>
                    <asp:RadioButtonList ID="RblMuscleStiff" runat="server">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td>Alopecia:</td>
                <td>
                    <asp:RadioButtonList ID="RblAlopecia" runat="server">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td>Obesity:</td>
                <td>
                    <asp:RadioButtonList ID="RblObesity" runat="server">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td><asp:LinkButton ID="lbPredict" runat="server" OnClick="lbPredict_Click">Predict</asp:LinkButton></td>
                <td> <asp:Label ID="lblResults" runat="server" Text="Predicted Value"></asp:Label>
                    </td>
            </tr>
        </table>
       
    </form>
</body>
</html>
