import 'package:flutter/material.dart';

  //*************************

    // Box Scroller Settings \\
    double boxHeight = 150.0;
    double boxWidth = 150.0;
    
  //**************************

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    //*************************
    // Box Scroller Settings \\
    double boxHeight = 150.0;
    double boxWidth = 150.0;
    double betweenSpacing = 12.0; //WORKS
    String titleText = "Hello";
    String underCardText = "Food";
    //       Settings End     \\
    //**************************

    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const SizedBox(height: 15,),
          const SizedBox(
            height: 40,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0), //Padding for the Goals page
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text( //Goals heading text
                  "Goals", //** HEADING TEXT */
                  style: TextStyle(fontSize: 35),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 210,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index) => buildCard(index),
              separatorBuilder: (context, index) {
                return  SizedBox(
                  width: betweenSpacing, //** BETWEEN SPACING */
                );
              },
              itemCount: 10,
            ),
          )
        ],
      )),
    );
  }

  Widget buildCard(index) => Column(

        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              'https://source.unsplash.com/random?sig=$index', //** IMAGE HERE */
              height: 150, //** BOX HEIGHT */
              width: 150,  //** BOX WIDTH */
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text('Goal $index'), //**IMAGE CAPTION TEXT */
        ],
      );
}