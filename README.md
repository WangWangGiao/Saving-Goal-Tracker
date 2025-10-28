# VAULTURE (Saving Goal Tracker)

VAULTURE is a Flutter-based application that allows users to quickly and efficiently calculate the number of weeks needed to reach the target amount. Users simply input the target amount, weekly saving, and starting balance. This application can be accessed anytime and anywhere based on the user’s demand.

Input

•	TextField (Target Amount) – User needs to input the number into the text field.

•	TextField (Saving Amount / Week) – User needs to input the number into the text field.

•	TextField (Starting Balance) – User needs to select the type based on their demands.

Process

•	Weeks Needed – (Target Amount / Starting Balance) / Saving Amount (Week)  

•	Days Needed – Weeks Needed * 7

Output

•	Weeks Needed (Goal)

•	Days Needed

Widget List Used

•	MaterialApp

•	ThemeData

•	ColorScheme

•	Scaffold

•	Container

•	Padding

•	Column

•	SizedBox

•	Spacer

•	BoxDecoration

•	LinearGradient

•	Image.asset

•	Text

•	LinearProgressIndicator

•	SingleChildScrollView

•	Center

•	Row

•	Visibility

•	TextField

•	ElevatedButton

•	ButtonStyle

•	WidgetStatePropertyAll

•	AppBar

•	Icon

Basic Validation Approach

•	Check for double datatype. If the user inputs a value that is not a valid number (double datatype), a warning will display by changing the text color to red and showing the warning in warning area. 
(e.g. Target Amount must be in numeric form! (1,2,3..))

•	Check for empty value – If the user does not input anything in the TextField and presses the Calculate button, a warning will be displayed by changing the text color to red and show the warning in warning area. (e.g. Target Amount cannot be empty!)

•	Check specify TextField logic – If the user inputs 0 in the Target Amount TextField and Saving Amount / Week TextField, a warning will be displayed by changing the text color to red and show the warning in warning area. 
(e.g. Target Amount cannot be 0 or less than 0!) Then, if the user inputs a value less than 0 in the Starting Balance TextField, show the warning in warning area (e.g. Starting Balance cannot less than 0!)

•	Check decimal point – If the user inputs a value start with a decimal point (.11), a warning will be displayed by changing the text color to red and show the warning in warning area. 
(e.g. Target Amount cannot start with decimal point! (. xx))

•	Check decimal places – If the inputs contain more than 2 decimal places, a warning will be displayed by changing the text color to red and show the warning in warning area. 
(e.g. Target Amount at most two decimal places! (x.xx))

<table>
  <tr>
    <td align="center">
      <img src="https://github.com/WangWangGiao/my-project-assets/blob/main/Vaulture_SS.png?raw=true" alt="SplashScreen" width="250"/>
      <br>
      <b>SplashScreen</b>
    </td>
    <td align="center">
      <img src="https://github.com/WangWangGiao/my-project-assets/blob/main/Vaulture_HomeBefore.png?raw=true" alt="HomeBefore" width="250"/>
      <br>
      <b>Home Before</b>
    </td>
    <td align="center">
      <img src="https://github.com/WangWangGiao/my-project-assets/blob/main/Vaulture_HomeAfterCalculation.png?raw=true" alt="HomeAfterCalculation" width="250"/>
      <br>
      <b>Home After Calculation</b>
    </td>
  </tr>
</table>
