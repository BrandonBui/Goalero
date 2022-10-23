import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:goalero/customGoalPages/customAddGoal.dart';
import 'package:goalero/customGoalPages/mainGoal.dart';
import 'package:google_fonts/google_fonts.dart';
class goalType extends StatefulWidget {
  const goalType({super.key});

  @override
  State<goalType> createState() => _goalTypeState();
}

class _goalTypeState extends State<goalType> {
  @override
    var subGoals=0;
    var mainGoals=0;
    Color buttonColor1 = Color(0xFFD8CEFF);
    Color buttonColor2 = Color(0xFFD8CEFF);
    Color textColor = Colors.black;
    Color textColor2 = Colors.black;
  Widget build(BuildContext context) {

  int getSubGoalsVar(){
    return subGoals;
  }
    int getMainGoalVar(){
    return mainGoals;
  }
    void incrementSub(){
    subGoals++;
  }
  void incrementMain(){
    mainGoals++;
  }
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
              height: height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,//to make gradient
                 colors: [ //background gradient
                  Color(0xFFC5A1FF),
                  Color(0xFFB2ACFF),
                  Color(0xFF9CB7FF),
                  Color(0xFF8BC0FF),
                  Color(0xFF81C9FF),
                  Color(0xFF7ED2FF),
                  Color(0xFF80D8FF),
      
                  ])
              ),
              child: Stack(
                children: [
                  Align(
                alignment: Alignment.topLeft,
                child: SafeArea(
                  child: Container(
                    margin: EdgeInsets.only(top:30.0, left: 30.0),
                    child: GestureDetector(
                      child: const Icon(Icons.arrow_back_ios_new),
                      onTap: (){
                        Navigator.pop(context); //go back to previous page
                      },
                      ),
                  ),
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding:  EdgeInsets.only(top: height/6), //take up 1/6th of the screen's height
                    child: SafeArea(
                      child: Text("What's your Goal like?", style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 300,
                          height: 100,
                          child: ElevatedButton(
                            onPressed: (){
                              incrementMain(); //to show main was clicked
                              
                              if (getMainGoalVar() %2 ==0){ //not clicked
                              setState((){
                                buttonColor1 = Color(0xFFD8CEFF);
                                textColor = Colors.black;
                              });
                              } else{
                                if (getSubGoalsVar() % 2 != 0){
                                  setState(() {
                                     buttonColor2 = Color(0xFFD8CEFF);
                                     textColor2 = Colors.black;
                                  });
                                }                             
                                if (getMainGoalVar() %2 == 1){
                                  setState(() {
                                    buttonColor1 = Color.fromARGB(255, 138, 97, 233);
                                    textColor = Colors.white;
                                  });
                                  
                                }
                              }
                          }, 
                          child: Text("Objective but has multiple parts to it", style: GoogleFonts.poppins(
                                              color: textColor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal),textAlign: TextAlign.center,),
                          style: ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
                                        side: BorderSide(color: Color(0xFF834ADF))
                                        )
                                    ),
                                    backgroundColor: MaterialStateProperty.all<Color>(buttonColor1,
                          )
                
                                ),
                                )
                                ),
                
                                SizedBox(
                          width: 300,
                          height: 100,
                          child: ElevatedButton(
                            onPressed: (){
                              incrementSub(); //to show sub was clicked
                              if (getSubGoalsVar() %2 ==0){ // if not clicked (logic made so you can click same button twice to deselect)
                              setState((){
                                buttonColor2 = Color(0xFFD8CEFF);
                                textColor2 = Colors.black;
                              });
                              } else{ //is clicked
                                if (getMainGoalVar() % 2 != 0){ //if other button is clicked
                                  setState(() {
                                     buttonColor1 = Color(0xFFD8CEFF); //change other button color back to normal color
                                     textColor = Colors.black;
                                  });
                                }                             
                                if (getSubGoalsVar() %2 == 1){
                                  setState(() {
                                    buttonColor2 = Color.fromARGB(255, 138, 97, 233); //change our button color to be selected
                                    textColor2 = Colors.white;
                                  });
                                  
                                }
                              }
                          }, 
                          child: Text("Different sections which are related", style: GoogleFonts.poppins(
                                              color: textColor2,
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal),textAlign: TextAlign.center,
                                      ),
                          style: ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(18.0), bottomRight: Radius.circular(18.0)),
                                        side: BorderSide(color: Color(0xFF834ADF))
                                        )
                                    ),
                                    backgroundColor: MaterialStateProperty.all<Color>(buttonColor2,
                                    )
                
                          ),
                          )
                          ),
                        ],
                    ),
                  ),
                )],
              ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom:80.0),
                      child: SizedBox(
                        height: 50, //height of button
                        width: 200, //width of button
                        child: ElevatedButton(
                          onPressed:(){
                            print(getSubGoalsVar());
                            print(getMainGoalVar());
                            if (getMainGoalVar() % 2 !=0){ //is selected
                              Navigator.push(context,MaterialPageRoute(builder: (context)=> mainGoal()));
                            }else{
                              Navigator.push(context,MaterialPageRoute(builder: (context)=> customAddGoalLanding()));
                            }
                            
                          }, 
                          child: Text("Next", style:GoogleFonts.poppins(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Color.fromARGB(255, 138, 97, 233))
                                )
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 138, 97, 233)),
                          ), 
                        ),
                      ),
                    ),
                )
              ],
              ),
            ),
          
      
      ),
    );
  }
}
