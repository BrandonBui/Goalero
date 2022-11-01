import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class mainGoal extends StatefulWidget {
  const mainGoal({super.key});

  @override
  State<mainGoal> createState() => _mainGoalState();
}

class _mainGoalState extends State<mainGoal> {
//VARIABLES

  //controller to recieve subgoal info
  int _focusedIndex = 0;
  String default_message = "Enter Subgoal";
  String no_msg = "";
  DateTime date = DateTime
      .now(); //gets current time to set default value when user lands on page
  late String formatted_date_ = DateFormat('MM/dd/yyyy - hh:mm')
      .format(date); //will get formatted into correct format

//LISTS

  List meetingContent = [
    "Some SubGoal",
  ];
  List controllers = [
    TextEditingController()
  ];
  List<Widget> subgoals = [
    Container(
      //container holds name text input
      margin: EdgeInsets.only(
          left: 100,
          top:
              20.0), //adjusts how far away from the left and name text field box is
    
      child: SizedBox(
        width: 100 / 1.2,
        height: 100 ,
        child: PhysicalModel(
          elevation: 10.0,
          color: Color.fromARGB(255, 223, 222, 222), //color of text field box
          borderRadius: BorderRadius.circular(25),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
              labelText: 'Goal Name...',
              filled: true,
              fillColor: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    ),
  ];

// ALL FUNCTIONS


//FUNCTION - DATEPICKER
  void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        //this is the cupertino date picker
        context: ctx,
        builder: (_) => Container(
              height: 500,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    child: CupertinoDatePicker(
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (val) {
                          setState(() {
                            date = val;
                            formatted_date_ =
                                DateFormat('MM/dd/yyyy - hh:mm').format(date);
                          });
                        }),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: const Text('Submit'),
                    onPressed: () => Navigator.of(ctx).pop(),
                  )
                ],
              ),
            )
        );
  }
//SUBGOALS WIDGET
  Widget subGoals(int index) => Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
 //adjusts how far away from the left and name text field box is
            child: SizedBox(
              width: 300,
              height: 50,
              
              child: PhysicalModel(
                elevation: 10.0,
                color: Color.fromARGB(
                    255, 223, 222, 222), //color of text field box
                borderRadius: BorderRadius.circular(25),
                child: TextFormField(
                  controller: controllers[index],
                  onChanged: (newValue) {
                    //if input is changed
                    setState(() {
                      meetingContent[index] = controllers[index].text;
                      //troubleshooting to check if test is inside list now
                      print(meetingContent[index]);
                      //when user types in a subgoal erase default prompt for subgoal text
                      default_message = no_msg;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none),
                    labelText: default_message,
                    filled: true,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
          ),
      );

  Widget reminders(String msg)=> Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  
                     child: ElevatedButton(
                        onPressed: (){
        
                        }, 
                        child: Text(msg, style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w400)),
                        style: ButtonStyle( //all button styling
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>( //rounds button
                               RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(18.0)),
                                
                                  ),
                              ),backgroundColor:MaterialStateProperty.all<Color>(Color.fromARGB(255, 212, 199, 250)),
                        ),
                      )
                
                ),
              );

//DISPOSE FUNCTION
  @override
  void dispose() {
    // Cleans up the controller list when the widget is disposed.
    for (TextEditingController i in controllers){
      i.dispose();
    }
    super.dispose();
  }

//MAIN

  Widget build(BuildContext context) {
    print(formatted_date_);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight, //to make gradient
                colors: [
              //background gradient
              Color(0xFF8BC0FF),
              Color(0xFF81C9FF),
              Color(0xFF7ED2FF),
              Color(0xFF80D8FF),
              Color(0xFF9CB7FF),
              Color(0xFF9CB7FF),
              Color(0xFFB2ACFF),
              Color(0xFFC5A1FF),
              
            ])
        ), 
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                //this row is for the back button and the main goal text
                child: SafeArea(
                  child: Container(
                    margin: EdgeInsets.only(top: 30.0, left: 30.0),
                    child: GestureDetector(
                      child: const Icon(Icons.arrow_back_ios_new),
                      onTap: () {
                        Navigator.pop(context); //go back to previous page
                      },
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: width / 9, top: 20.0), //padding from ios back button
                child: Text("Name",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                //container holds name text input
                margin: EdgeInsets.only(
                    left: width / 12,
                    top:
                        20.0), //adjusts how far away from the left and name text field box is
                child: SizedBox(
                  width: width / 1.2,
                  height: height / 16,
                  child: PhysicalModel(
                    elevation: 10.0,
                    color: Color.fromARGB(
                        255, 223, 222, 222), //color of text field box
                    borderRadius: BorderRadius.circular(25),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                        labelText: 'Goal Name...',
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                  //creates space between name and end date elements
                  height: 30.0),
              Container(
                //end date text
                margin: EdgeInsets.only(left: width / 9),
                child: Text("End Date",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                //container holds date input
                margin: EdgeInsets.only(
                    left: width / 12,
                    top:
                        20.0), //adjusts how far away from the left and top name text field box is
                child: SizedBox(
                  width: width / 1.2,
                  height: height / 16,
                  child: PhysicalModel(
                      elevation: 10.0,
                      color: Color.fromARGB(
                          255, 255, 255, 255), //color of text field box
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(formatted_date_,
                                    style: GoogleFonts.poppins(
                                        color: Color.fromARGB(255, 137, 136, 136),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400))),
                          ),
                          Padding(
                            //added padding so text doesn't stick to the edge of the white box
                            padding: const EdgeInsets.only(right: 15),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 20),
                                ),
                                onPressed: () {
                                  _showDatePicker(context);
                                },
                                child: Text('Change',
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300)),
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: width / 9, top: 30.0),
                child: Text("Main Goal",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              Container( //container holds main goal text input
                margin: EdgeInsets.only(
                    left: width / 12,
                    top: 20.0), 
                    //above code adjusts how far away from the left and name text field box is
                child: SizedBox(
                  width: width / 1.2,
                  height: height / 16,
                  child: PhysicalModel(
                    elevation: 10.0,
                    color: Color.fromARGB(
                        255, 223, 222, 222), //color of text field box
                    borderRadius: BorderRadius.circular(25),
                    child: TextFormField( //creates text field
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                        labelText: 'Main Objective Name...',
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ),
        
              //SUBGOAL SECTION
              Container(
                //formatting of subgoals text
                margin: EdgeInsets.only(left: width / 9, top: 30.0),
                child: Row(
                  children: [
                    Text("Sub Goals",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    SizedBox(width: 140), //to seperate the text and the add icon
                    BouncingWidget(
                      duration: Duration(milliseconds: 200),
                      scaleFactor: 1.5,
                        child: Icon(Icons.add),
                        onPressed:(){
                          setState(() {
                            controllers.add(TextEditingController());
                            meetingContent.add(meetingContent.length +1);
                          });
                        }
                    ),
                  ],
                ),
              ),
              SizedBox(height:10),
              //subgoal tiles implementation
              Align(
                alignment: Alignment(0, 0.7),
                child: SizedBox(
                    height: 150,
                    child: ScrollSnapList(
                      itemBuilder: (context, index) {
                        return subGoals(index);
                      },
                      //This is part of the ScrollSnapList package
                      itemCount: meetingContent.length, //we want to update list everytime subgoal is added
                      dynamicItemSize: true, //makes it snap
                      itemSize: 70, //can impact how fast scroll is and the size of items inside scroll. Careful when you change viewport height.
                      onItemFocus: (index) {
                        setState(() {
                          _focusedIndex = index;
                        });
                      },
                      scrollDirection: Axis.vertical, //direction of scroll
                    )),
              ),
              Container(
                //formatting of subgoals text
                margin: EdgeInsets.only(left: width / 9, top: 10.0),
                
                   child: Text("Reminders",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Row(
                  children: [
                    reminders("Daily"),
                    SizedBox(width: 10,),
                    reminders("Weekly"),
                    SizedBox(width: 10,),
                    reminders("Monthly"),
                  ],
                ),
              ),
              SizedBox(height: 20,),
               ElevatedButton(
                style: ElevatedButton.styleFrom(
                  
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Color.fromARGB(255, 130, 101, 246),
                  ),
                onPressed: () {
                  
                },
                
                child: Text(
                  'Add Goal',
                  style:GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      )
      );
  }
}
