// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Months extends StatefulWidget {
  final String selectedDay;
  final int? getindex;
  final int countDays;
  const Months({super.key,  required this.countDays, required this.selectedDay, this.getindex, });
  @override
  State<Months> createState() => _MonthsState();
}

class _MonthsState extends State<Months> {



  @override
  void initState() {
    super.initState();
    // print(widget.selectedDay);
    // print(widget.countDays);
    // print(widget.getindex);
  }


  @override
  Widget build(BuildContext context) {

    DateTime currentDate = DateTime.now();

    String currentMonth = DateFormat('MMMM').format(currentDate);

    // List<int> numbers = [];
    // for (int n = 1; n <= widget.countDays; n++) {
    //   numbers.add(n);
    // }
    // print(numbers);
    final List<String> days = [
      "Sun",
      "Mon",
      "Tue",
      "Wed",
      "Thu",
      "Fri",
      "Sat",
    ];
    // Select the index to start from using a switch case
    int startDay(String day) {
      switch (day) {
        case 'Sunday':
          return 0;
        case 'Monday':
          return 1;
        case 'Tuesday':
          return 2;
        case 'Wednesday':
          return 3;
        case 'Thursday':
          return 4;
        case 'Friday':
          return 5;
        case 'Saturday':
          return 6;
        default:
          return 0;
      }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text("Month"),
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Container(
            height: 40,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.redAccent),
            ),
            child: Center(
              child: Text("Current Month : $currentMonth"),
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 600,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          // physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 25,
                            mainAxisExtent: 50,
                            childAspectRatio: 1.0
                          ), 
                          itemCount: 42,
                          itemBuilder: (BuildContext context, int index){
                            int i = (index % 6);
                            int j = (index/6).floor();
                            if(i==0 && j<=6){
                              return Container(
                                    decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red, width: 2)),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                      Text(
                                        days[j], 
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                );
                              }else{
                                  int firstday = startDay(widget.selectedDay);
                                  int nofdays = widget.countDays;
                                  int gridval = ((i*7)+j)-firstday-6;
                                  int date = gridval==-5 && nofdays>=30?gridval=30:gridval==-4&&nofdays==31?gridval=31:gridval<=0||gridval>nofdays?0:gridval;
                                  print(date);
                                  print(index);
                                return date==0?Container():Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 2)),
                                  child: Center(
                                    child: Text(
                                      gridval.toString(),
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } 
}














































































































    // // Check if the index is greater than or equal to the start index
    // if (index >= startIndex) {
    //   // Check if the index is less than the length of the numbers list
    //   if (index - startIndex < numbers.length) {
    //     // Calculate the displayed number based on the starting index
    //     int displayedNumber = numbers[index - startIndex];

    //     // Display the number in a container with some padding and border
    //     return Container(
    //       padding: EdgeInsets.all(8),
    //       decoration: BoxDecoration(
    //         border: Border.all(color: Colors.black, width: 2),
    //       ),
    //       child: Center(
    //         child: Text(
    //           displayedNumber.toString(),
    //           style: TextStyle(fontSize: 18),
    //         ),
    //       ),
    //     );
    //   } else {
    //     // Display an empty container for remaining indices
    //     return Container();
    //   }
    // } else {
    //   // Display the remaining numbers (30 and 31) on the remaining indices
    //   int remainingNumbersIndex = index - startIndex + numbers.length;
    //   // Check if the remaining index is within the numbers list
    //   if (remainingNumbersIndex == 25 || remainingNumbersIndex == 26) {
    //     // Display 30 on index 26 and 31 on index 28
    //     int displayedNumber = remainingNumbersIndex == 25 ? 30 : 31;
    //     // Display the number in a container with some padding and border
    //     return Container(
    //       padding: EdgeInsets.all(8),
    //       decoration: BoxDecoration(
    //         border: Border.all(color: Colors.black, width: 2),
    //       ),
    //       child: Center(
    //         child: Text(
    //           displayedNumber.toString(),
    //           style: TextStyle(fontSize: 18),
    //         ),
    //       ),
    //     );
    //   } else {
    //     // Display an empty container for other remaining indices
    //     return Container();
    //   }
    // }

//  // Calculate the starting index for the numbers
//     int startIndex = widget.getindex!;

//     // Check if the index is greater than or equal to the start index
//     if (index >= startIndex) {
//       // Check if the index is less than the length of the numbers list
//       if (index - startIndex < numbers.length) {
//         // Calculate the displayed number based on the starting index
//         int displayedNumber = numbers[index - startIndex];

//         // Display the number in a container with some padding and border
//         return Container(
//           padding: EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.black, width: 2),
//           ),
//           child: Center(
//             child: Text(
//               displayedNumber.toString(),
//               style: TextStyle(fontSize: 18),
//             ),
//           ),
//         );
//       } else {
//         // Display an empty container for remaining indices
//         return Container();
//       }
//     } else {
//       // Display the remaining numbers (30 and 31) on the correct indices
//       int remainingNumbersIndex = numbers.length - startIndex + index;

//       // Check if the remaining index is within the numbers list
//       if (remainingNumbersIndex < numbers.length && remainingNumbersIndex >= 29) {
//         int displayedNumber = numbers[remainingNumbersIndex];

//         // Display the number in a container with some padding and border
//         return Container(
//           padding: EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.black, width: 2),
//           ),
//           child: Center(
//             child: Text(
//               displayedNumber.toString(),
//               style: TextStyle(fontSize: 18),
//             ),
//           ),
//         );
//       } else {
//         // Display an empty container for remaining indices
//         return Container();
//       }
//     }

                      
       // Calculate the displayed number based on the index
    // int displayedNumber;

    // if (index - 6 >= 0 && index - 6 < numbers.length) {
    //   // If the index is within the valid range, display the number
    //   displayedNumber = numbers[index - 6];
    // } else if (index == 29) {
    //   // Display 30 at -4th index
    //   displayedNumber = 30;
    // } else if (index == 28) {
    //   // Display 31 at -5th index
    //   displayedNumber = 31;
    // } else {
    //   // If the index is beyond the range, display an empty container
    //   return Container();
    // }

    // // Display the number in a container with some padding and border
    // return Container(
    //   padding: EdgeInsets.all(8),
    //   decoration: BoxDecoration(
    //     border: Border.all(color: Colors.black, width: 2),
    //   ),
    //   child: Center(
    //     child: Text(
    //       displayedNumber.toString(),
    //       style: TextStyle(fontSize: 18),
    //     ),
    //   ),
    // );



















//  // Calculate the displayed number based on the index
//     int displayedNumber;
    
//     if (index - 6 >= 0 && index - 6 < numbers.length) {
//       // If the index is within the valid range, display the number
//       displayedNumber = numbers[index - 6];
//     } else if (index == 29) {
//       // Display 30 at -5th index
//       displayedNumber = 30;
//     } else if (index == 28) {
//       // Display 31 at -4th index
//       displayedNumber = 31;
//     } else {
//       // If the index is beyond the range, display an empty container
//       return Container();
//     }

//     // Display the number in a container with some padding and border
//     return Container(
//       padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black, width: 2),
//       ),
//       child: Center(
//         child: Text(
//           displayedNumber.toString(),
//           style: TextStyle(fontSize: 18),
//         ),
//       ),
//     );

//  // Check if the index is greater than or equal to the start index
//                     if (index >= startIndex && index - startIndex < numbers.length) {
//                     // Calculate the displayed number based on the starting index
//                     int displayedNumber = numbers[index - startIndex];
//                     // Display the number in a container with some padding and border
//                           return Container(
//                             padding: EdgeInsets.all(8),
//                             decoration: BoxDecoration(
//                             border: Border.all(color: Colors.black, width: 2)),
//                               child: Center(
//                               child: Text(
//                               displayedNumber.toString(),
//                               style: TextStyle(fontSize: 18),
//                             ),
//                           ),
//                         );
//                       } else {
//                       // Display an empty container
//                       return Container();
//                     }















                  // List<Widget> items = [];
                  // for (int i=0;i<widget.countDays;i++){
                  //   print(widget.countDays);
                  //   int number = i + 1;                    
                  //   items.add(
                  //     Container(
                  //     // height: 10,
                  //     // width: 10,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(20),
                  //         border: Border.all(color: Colors.black),             
                  //       ),
                  //     child: Center(child: Text('$number'),
                  //     ),
                  //   ),
                  // );
                  // // print(number);
                  // }
                  // if(index<items.length){
                  //   return items[index];
                  // }else{
                  //   return Container();
                  // }




//    days(String day) {
//   // A variable to store the day number
//   int day = 1;
  
//   // A switch case statement to display the corresponding day name
//   switch (day) {
//     case 1:
//       print('Sunday');
//       break;
//     case 2:
//       print('Monday');
//       break;
//     case 3:
//       print('Tuesday');
//       break;
//     case 4:
//       print('Wednesday');
//       break;
//     case 5:
//       print('Thursday');
//       break;
//     case 6:
//       print('Friday');
//       break;
//     case 7:
//       print('Saturday');
//       break;
//     default:
//       print('Invalid day number');
//       break;
//   }
// }













// Row(
//         children: [
//             Column(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children:  [
//                 Spacer(flex: 1),
//                 Text('Monday',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.red),),
//                 Spacer(flex: 2),
//                 Text('Tuesday',style: TextStyle(fontSize: 18,fontWeight:  FontWeight.w400,color: Colors.red),),
//                 Spacer(flex: 2),
//                 Text('Wednesday',style: TextStyle(fontSize: 18,fontWeight:  FontWeight.w400,color: Colors.red),),
//                 Spacer(flex: 2),
//                 Text('Thursday',style: TextStyle(fontSize: 18,fontWeight:  FontWeight.w400,color: Colors.red),),
//                 Spacer(flex: 2),
//                 Text('Friday',style: TextStyle(fontSize: 18,fontWeight:  FontWeight.w400,color: Colors.red),),
//                 Spacer(flex: 2),
//                 Text('Saturday',style: TextStyle(fontSize: 18,fontWeight:  FontWeight.w400,color: Colors.red),),
//                 Spacer(flex: 2),
//                 Text('Sunday',style: TextStyle(fontSize: 18,fontWeight:  FontWeight.w400,color: Colors.red),),
//                 Spacer(flex: 1),
//               ],
//             ),
            // Expanded(
            //   child: SizedBox(
            //     width: MediaQuery.of(context).size.width,
            //     child: GridView.builder(
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       physics: NeverScrollableScrollPhysics(),
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 7,
            //         mainAxisSpacing: 10.0,
            //         crossAxisSpacing: 12.0,
            //         childAspectRatio: MediaQuery.of(context).size.width /
            //             (MediaQuery.of(context).size.height / 4.2),
            //         ), 
            //         itemCount: 35,
            //       itemBuilder: (BuildContext context, int index){
            //         List<Widget> items = [];
            //         for (int i=0;i<31;i++){
            //           int number = i +1;
            //         items.add(
            //           Container(
            //           height: 10,
            //           width: 10,
            //           color: Colors.amber,
            //           child: Center(child: Text('$number'),
            //           ),
            //         ),
            //       );
            //         // print(number);
            //         }
            //         if(index<items.length){
            //           return items[index];
            //         }else{
            //           return Container();
            //         }
            //       },
            //     ),
            //   ),
            // ),
//         ],
//       ),