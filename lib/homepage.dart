import 'package:flutter/material.dart';

class SavingGoalCalculator extends StatefulWidget {
  const SavingGoalCalculator({super.key});

  @override
  State<SavingGoalCalculator> createState() => _SavingGoalCalculatorState();
}

class _SavingGoalCalculatorState extends State<SavingGoalCalculator> {
  // TextField Controller for [Target Amount] [Saving Per Week] [Starting Balance]
  TextEditingController targetAmountController = TextEditingController();
  TextEditingController savingPerWeekController = TextEditingController();
  TextEditingController startingBalanceController = TextEditingController();

  //Store Warning Message [Once error occur]
  String warning ="";
  Color targetAmountContainerColor = Colors.grey;
  Color savingPerWeekContainerColor = Colors.grey;
  Color startingBalanceContainerColor = Colors.grey;

  //Control the 'Result' Container visiblility
  bool resultVisible = false;
  //Result
  double targetAmount = 0;
  double savingPerWeek = 0;
  double startingBalance = 0;
  double resultWeekNeeded = 0;
  int resultDayNeeded = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Saving Goal Tracker',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      //Allowing to scroll the interface (avoid screen overflow)
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //=== TARGET AMOUNT CONTAINER ===
              Container(
                margin: const EdgeInsets.fromLTRB(30, 50, 30, 0),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                decoration: BoxDecoration(
                  border: Border.all(color: targetAmountContainerColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Target Amount (RM)",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),), 
                    TextField(decoration: InputDecoration(
                      hintText: "Enter Target Amount",
                      prefixIcon: Icon(Icons.track_changes),
                    ),
                    style: TextStyle(fontSize: 20,),
                    keyboardType: TextInputType.number,
                    controller: targetAmountController,
                    )
                  ]
                ),
              ),
              //=== SAVING AMOUNT PER WEEK CONTAINER ===
              Container(
                margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                decoration: BoxDecoration(
                  border: Border.all(color: savingPerWeekContainerColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Saving Amount (RM) / Week",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),), 
                    TextField(decoration: InputDecoration(
                      hintText: "Enter Saving Per Week",
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                    style: TextStyle(fontSize: 20,),
                    keyboardType: TextInputType.number,
                    controller: savingPerWeekController,
                    )
                  ]
                ),
              ),
              //=== STARTING BALANCE CONTAINER ===
              Container(
                margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                decoration: BoxDecoration(
                  border: Border.all(color: startingBalanceContainerColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Starting Balance (RM)",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),), 
                    TextField(decoration: InputDecoration(
                      hintText: "Enter Starting Balance",
                      prefixIcon: Icon(Icons.account_balance_wallet),
                    ),
                    style: TextStyle(fontSize: 20,),
                    keyboardType: TextInputType.number,
                    controller: startingBalanceController,
                    )
                  ]
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ELEVATEDBUTTON 'CALCULATE' TO CALCULATE THE WEEK NEEDED TO HIT GOAL
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.teal)),
                    onPressed: calculate, child: Text('Calculate',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                    )
                  ),
                  SizedBox(width: 20),
                  // ELEVATEDBUTTON 'RESET' TO RESET ALL THE INFORMATION AND RESULT CONTAINER
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.teal)),
                    onPressed: resetAll, child: Text('Reset',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                    )
                  ),
                ],
              ),
              //=== WARNING TEXT AREA ===
              SizedBox(
                  height: 35,
                  child: Text(warning,style: TextStyle(fontSize:15,fontWeight:FontWeight.bold,color: Colors.red),)
                  ),
              //== USING VISIBILITY TO CONTROL THE VISIBLE OF RESULT TEXT AREA
              Visibility(
                visible: resultVisible,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Result',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Target Amount",style: TextStyle(fontSize: 20)),
                          Text("RM$targetAmount",style: TextStyle(fontSize: 20))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Saving / Week",style: TextStyle(fontSize: 20)),
                          Text("RM$savingPerWeek",style: TextStyle(fontSize: 20))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Starting Balance",style: TextStyle(fontSize: 20)),
                          Text("RM$startingBalance",style: TextStyle(fontSize: 20))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Weeks Needed (Goal)",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey),),
                          Text("$resultWeekNeeded Weeks",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.teal),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Around",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey),),
                          Text("$resultDayNeeded Days",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.teal),)
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void calculate() {
    //Validate the user input text, stop process when the input text is invalid.
    //Container changed color to red to let user pay attention on that specific text field
    if(!validateInput(targetAmountController.text, 'Target amount')){
      targetAmountContainerColor = Colors.red;
      setState(() {});
      return;
    }else{
      targetAmountContainerColor = Colors.black;
      setState(() {});
    }

    if(!validateInput(savingPerWeekController.text, 'Saving amount')){
      savingPerWeekContainerColor = Colors.red;
      setState(() {});
      return;
    }else{
      savingPerWeekContainerColor = Colors.black;
      setState(() {});
    }

    if(!validateInput(startingBalanceController.text, 'Starting balance')){
      startingBalanceContainerColor = Colors.red;
      setState(() {});
      return;
    }else{
      startingBalanceContainerColor = Colors.black;
      setState(() {});
    }

    //Parse the String datatype into double datatype
    double targetAmountParse = double.parse(targetAmountController.text);
    double savingAmountPerWeekParse = double.parse(savingPerWeekController.text);
    double startingBalanceParse = double.parse(startingBalanceController.text);

    //Starting Balance already hit the goal(target amount), result will be 0 weeks / 0 days
    if(targetAmountParse <= startingBalanceParse){
      resultWeekNeeded = 0;
      resultDayNeeded = 0;
    }else{
    //Calculation for week needed to hit goal
    double weekNeeded = (targetAmountParse - startingBalanceParse) / savingAmountPerWeekParse;
    //Convert the number to 2 decimals
    resultWeekNeeded = double.parse(weekNeeded.toStringAsFixed(2));
    //Convert the number without decimals and multiply 7 to get the needed days.
    resultDayNeeded = resultWeekNeeded.round() * 7;
    }

    //Display the user input make user easy to view
    targetAmount = targetAmountParse;
    savingPerWeek = savingAmountPerWeekParse;
    startingBalance = startingBalanceParse;
    resultVisible = true;
    warning = "";
    setState(() {});
  }

  bool validateInput(String input, String widgetName){
    //Using tryParse to check the input is double datatype or not, if not return null value
    //Using double? to store either double datatype or null value.
    double? numberValid = double.tryParse(input);

    //Check the input is empty or not
    if(input.isEmpty){
      warning = '$widgetName cannot be empty!';
      resultVisible = false;
      return false;
    }

    //Check the input is number format or not
    if(numberValid == null){
      warning = '$widgetName must be in numeric form! (1,2,3..)';
      resultVisible = false;
      return false;
    }
    
    //Perform logic - check [Target amount] and [Saving amount] value, if less than or equal to 0 will occur warning
    //Only check the [Starting Balance] is less than 0 because it can be start by 0
    if(numberValid == 0 && (widgetName == 'Target amount' || widgetName == 'Saving amount')){
      warning = '$widgetName cannot be 0 or less than 0!';
      resultVisible = false;
      return false;
    }else if(numberValid < 0 ){
      warning = '$widgetName cannot less than 0!';
      resultVisible = false;
      return false;
    }

    //Avoid user input start with ".", example .123
    if(input.contains('.')){
      if(input.startsWith('.')){
        warning = '$widgetName cannot start with decimal point! (.xx)';
        resultVisible = false;
        return false;
      }
      //Check user input the number is only 2 decimal or not. [1] used to get the after "." value (list)
      String decimalCheck = input.split('.')[1];
      if(decimalCheck.length > 2){
        warning = '$widgetName at most two decimal places! (x.xx)';
        resultVisible = false;
        return false;
      }
    }
    
    return true;
}

  void resetAll() {
    //Reset all information and result
    targetAmountController.text = '';
    savingPerWeekController.text = '';
    startingBalanceController.text = '';

    resultWeekNeeded = 0;
    resultDayNeeded = 0;
    targetAmount = 0;
    savingPerWeek = 0;
    startingBalance = 0;

    warning = "";
    targetAmountContainerColor = Colors.black;
    savingPerWeekContainerColor = Colors.black;
    startingBalanceContainerColor = Colors.black;
    resultVisible = false;
    setState(() {});
  }
}