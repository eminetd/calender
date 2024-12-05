// ignore_for_file: prefer_const_constructors

import 'package:calender/routes/route.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedDay;
  int? countDays;
  int? selectedIndex = 0;
  

final List<String> month = [
    "January", 
    "February", 
    "March", 
    "April",
    "May",
    "June", 
    "July",
    "August",
    "September", 
    "October", 
    "November",
    "December",
  ];



  final List<String> days = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];
  final List<int> numofdays = [
    28,29,30,31,
  ];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Calender'),
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Text("Select Start Day"),
          for(final day in days)
          RadioListTile(
            title: Text(day),
            value: day, 
            groupValue: selectedDay, 
            onChanged: (value){
              setState(() {
                selectedDay = value!;
                print(value);
                int selectedIndex = days.indexOf(selectedDay!);
                print(selectedIndex);
              });
            },
            ),
            SizedBox(height: 10,),
            Text("Select No. of Days"),
            for(final num in numofdays)
            RadioListTile(
              title: Text("$num"),
              value: num, 
              groupValue: countDays, 
              onChanged: (value){
                setState(() {
                  countDays = value!;
                  print(countDays);
                });
              },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.months,arguments: {
                    'selectedIndex': days.indexOf(selectedDay!),
                    'selectedDay':selectedDay,
                    'countDays':countDays
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // background (button) color
                  foregroundColor: Colors.white, // foreground (text) color
                  side: BorderSide(color: Colors.yellow, width: 3), // border color and width
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // corner radius
                ),
                ),                
                child: Text('Open Calender'),
              ),
        ],
      ),
    );
  }
}






















































// import 'package:flutter/material.dart';


// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String selectedDay = 'Sun';
//   String countDays = '31';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Day Selection'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Select a day :',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 10),
//             RadioGroup(
//               selectedDay: selectedDay,
//               onDaySelected: (day) {
//                 setState(() {
//                   selectedDay = day;
//                 });
//               },
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Selected Day: $selectedDay',
//               style: TextStyle(fontSize: 16),
//             ),
//             Countday(countDays: countDays, selectDays: (days){
//               setState(() {
//                 countDays  = days;
//               });
//             })
//           ],
//         ),
//       ),
//     );
//   }
// }
