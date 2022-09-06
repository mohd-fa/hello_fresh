import 'package:hello_fresh/spleshscreen.dart';
import 'package:hello_fresh/utils/colornotifire.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ColorNotifire()),
      ],
      child: const GetMaterialApp(
        home: Spleshscreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
// import 'dart:collection';

// import 'package:hello_fresh/home/home.dart';
// import 'package:flutter/material.dart';

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   ListQueue<int> _navigationQueue = ListQueue();
//   int index = 0;

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(

//       onWillPop: () async {

//         if (_navigationQueue.isEmpty) return true;

//         setState(() {
//           index = _navigationQueue.last;
//           _navigationQueue.removeLast();
//         });
//         return false;
//       },

//       child: Scaffold(
//         body: (getBody(index)),
//         bottomNavigationBar: BottomNavigationBar(
//           backgroundColor: Colors.white,
//           selectedItemColor: const Color(0xFFf5851f),
//           unselectedItemColor: Colors.grey,
//           type: BottomNavigationBarType.fixed,

//           currentIndex: index,


//           onTap: (value) {
//             _navigationQueue.addLast(index);
//             setState(() => index = value);

//           },

//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.restaurant),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.call),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.notifications),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_cart),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget scrop(){
//     return
//   }

//   Widget getBody(int index) {
//      switch (index) {
//       case 0:
//         return Home(); // Create this function, it should return your first page as a widget
//       case 1:
//         return Home(); // Create this function, it should return your second page as a widget
//       case 2:
//         return Home(); // Create this function, it should return your third page as a widget
//       case 3:
//         return Home(); // Create this function, it should return your fourth page as a widget
//     }
//   }
// }
