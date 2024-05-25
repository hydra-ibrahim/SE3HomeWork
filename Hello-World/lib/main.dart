import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/cubit/cubitfornotesapp.dart';
import 'package:helloworld/ui/mainpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => CubitForNoteApp()..fetchingNotesData(),
        child: const MainPage(),
      ),
    );
  }
}
// import 'dart:ui';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MainPage(),
//     );
//   }
// }

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   int _indexForDrawer = 0;
//   static List<Widget> listOfWidgets = [
//     Container(
//       height: 400,
//       width: 600,
//       color: Colors.pink,
//       child: const Text("Rare plants"),
//     ),
//     Container(
//       height: 500,
//       width: 600,
//       color: Colors.lime,
//       child: const Text("Coastal plants"),
//     ),
//     Container(
//         height: 500,
//         width: 600,
//         color: Colors.teal,
//         child: const Text("lettuce plants")),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: const Text(
//           "Example of Drawer",
//           style: TextStyle(color: Colors.white, fontSize: 25),
//         ),
//         centerTitle: true,
//       ),
//       body: Center(child: listOfWidgets[_indexForDrawer]),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             const DrawerHeader(
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                 ),
//                 child: Text(
//                   "Plants",
//                   style: TextStyle(color: Colors.white, fontSize: 25),
//                 )),
//             ListTile(
//               leading: const Icon(Icons.ac_unit),
//               title: const Text("Rare plants"),
//               tileColor: Colors.pink,
//               onTap: () {
//                 setState(() {
//                   _indexForDrawer = 0;
//                 });
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.water),
//               title: const Text("Coastal plants"),
//               tileColor: Colors.lime,
//               onTap: () {
//                 setState(() {
//                   _indexForDrawer = 1;
//                 });
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.fastfood),
//               title: const Text("lettuce plants"),
//               tileColor: Colors.teal,
//               onTap: () {
//                 setState(() {
//                   _indexForDrawer = 2;
//                 });
//                 Navigator.pop(context);
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// typedef ListOfInt = List<int>;

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // Application name
//       title: 'Flutter Hello World',
//       // Application theme data, you can set the colors for the application as
//       // you want
//       theme: ThemeData(
//         // useMaterial3: false,
//         primarySwatch: Colors.blue,
//       ),
//       // A widget which will be started on application startup
//       // home: const SwitchListTileExample(),
//       home: const MyHomePage(),
//     );
//   }
// }

// class SwitchListTileExample extends StatefulWidget {
//   const SwitchListTileExample({super.key});
//   @override
//   State<SwitchListTileExample> createState() => _SwitchListTileExampleState();
// }

// class _SwitchListTileExampleState extends State<SwitchListTileExample> {
//   bool _lights = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             backgroundColor: Colors.red, title: const Text("Example Column")),
//         body: Container(
//             width: 400,
//             height: 500,
//             color: Colors.lime[100],
//             alignment: Alignment.center,
//             child: SwitchListTile(
//               title: const Text('Lights'),
//               value: _lights,
//               onChanged: (bool value) {
//                 setState(() {
//                   _lights = value;
//                 });
//               },
//               secondary: const Icon(Icons.lightbulb_outline),
//             )));
//   }
// }
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(child: Text("Elevated Button")),
//       ),
//       body: Column(children: [
//         ElevatedButton.icon(
//           // style: ElevatedButton.styleFrom(
//           //     padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
//           //     elevation: 10,
//           //     shadowColor: Colors.lime,
//           //     backgroundColor: Colors.green,
//           //     foregroundColor: Colors.yellow,
//           //     shape: const BeveledRectangleBorder(),
//           //     side: const BorderSide(width: 2, color: Colors.lime),
//           //     textStyle: const TextStyle(fontSize: 25)),
//           onPressed: () {
//             ScaffoldMessenger.of(context)
//                 .showSnackBar(const SnackBar(content: Text("Elevated Button")));
//           },
//           icon: const Icon(Icons.add_box),
//           label: const Text("Elevated Button"),
//         )
//       ]),
//     );
//   }
// }
// class MyHomePage extends StatelessWidget {
//   final String title;
//   const MyHomePage({super.key, required this.title});

//   // final ListOfInt list1 = <int>[601, 160, 195, 450];
//   @override
//   Widget build(BuildContext context) {
//     final List<String> entries = <String>['A', 'B', 'C'];
//     final List<int> colorCodes = <int>[600, 300, 100];
//     return Scaffold(
//         appBar: AppBar(
//             backgroundColor: Colors.red, title: const Text("Example Column")),
// floatingActionButtonLocation:
//     FloatingActionButtonLocation.miniCenterFloat,
// floatingActionButton: FloatingActionButton.extended(
//     backgroundColor: Colors.lightGreenAccent,
//     foregroundColor: Colors.brown,
//     // splashColor: Colors.red,
//     hoverColor: Colors.red,
//     onPressed: () {},
//     icon: const Icon(Icons.add_call),
//     label: const Text("add_call")),
// body: ListView.separated(
//     padding: const EdgeInsets.all(8),
//     itemCount: entries.length,
//     itemBuilder: (BuildContext context, int index) {
//       return Container(
//         height: 50,
//         color: Colors.amber[colorCodes[index]],
//         child: Center(child: Text('Entry ${entries[index]}')),
//       );
//     },
//     separatorBuilder: (BuildContext context, int index) =>
//         const Divider())

// Container(
// width: 400,
// height: 500,
// color: Colors.lime[100],
// alignment: Alignment.center,
// child:
// GridView.builder(
//     padding: const EdgeInsets.all(10),
//     itemCount: 6,
//     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2,
//       mainAxisSpacing: 15,
//       crossAxisSpacing: 10,
//       // scrollDirection: Axis.horizontal,
//       // mainAxisExtent: 50
//       // mainAxisAlignment: MainAxisAlignment.spaceAround,
//       // crossAxisAlignment: CrossAxisAlignment.end,
//     ),
//     itemBuilder: (context, index) {
//       return GestureDetector(
//           onTap: () {
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text("item $index"),
//               duration: const Duration(seconds: 1),
//             ));
//           },
//           child: Container(
//               alignment: Alignment.center,
//               color: Colors.lightGreen,
//               child: Text("item $index")));
//     })
// children: [
//   Container(
//       color: Colors.red,
//       width: 100,
//       height: 50,
//       child: const Text("red")),
//   Container(
//       color: Colors.green,
//       width: 100,
//       height: 50,
//       child: const Text("green")),
//   Container(
//       color: Colors.yellow,
//       width: 100,
//       height: 50,
//       child: const Text("yellow")),
//   Container(
//       color: Colors.lime,
//       width: 100,
//       height: 50,
//       child: const Text("lime")),
//   Container(
//       color: Colors.brown,
//       width: 100,
//       height: 50,
//       child: const Text("brown")),
//   Container(
//       color: Colors.grey,
//       width: 100,
//       height: 50,
//       child: const Text("grey")),
//   Container(
//       color: Colors.blue,
//       width: 100,
//       height: 50,
//       child: const Text("blue")),
// IconButton(
//     style: IconButton.styleFrom(
//         backgroundColor: Colors.lightGreen),
//     onPressed: () {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text("circle_notifications")));
//     },
//     icon: const Icon(Icons.circle_notifications))
// ],
// )
// )
// appBar: AppBar(
//     title: const Text("Exercise1"),
//     centerTitle: true,
//     backgroundColor: Colors.pink,
//     leading: const Icon(Icons.umbrella, color: Colors.white, size: 25),
//     actions: [
//       IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.tv, color: Colors.white)),
//       IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.radio, color: Colors.white))
//     ],
//     // elevation: 40,
//     titleTextStyle: const TextStyle(
//         color: Colors.lime, fontSize: 35, fontWeight: FontWeight.bold)
//     // shadowColor: Colors.red,
//     // leadingWidth: 150,
//     ),
// body: IconButton.filled(
//     padding: const EdgeInsets.all(50),
//     iconSize: 100,
//     style: IconButton.styleFrom(
//         side: const BorderSide(width: 5, color: Colors.red),
//         backgroundColor: Colors.lightGreen,
//         foregroundColor: Colors.amberAccent,
//         hoverColor: Colors.redAccent.shade100,
//         highlightColor: Colors.pink,
//         shadowColor: Colors.green,
//         elevation: 10),
//     onPressed: () {},
//     icon: const Icon(Icons.tv_off))
// body: Container(
//     margin: const EdgeInsets.all(25),
//     padding: const EdgeInsets.all(25),
//     decoration: BoxDecoration(
//         gradient: const LinearGradient(
//             colors: [Colors.green, Colors.red], begin: Alignment.topLeft),
//         border: Border.all(width: 6, color: Colors.lightBlue),
//         borderRadius: BorderRadius.circular(26),
//         boxShadow: const [
//           BoxShadow(
//               color: Colors.lime, offset: Offset(10, 16), blurRadius: 5)
//         ]),
//     width: 200,
//     height: 250,
//     child: IconButton(
//         iconSize: 100,
//         highlightColor: Colors.lightBlue,
//         hoverColor: Colors.red,
//         onPressed: () {
//           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//               content: Text("example SnackBar"),
//               backgroundColor: Colors.yellow,
//               duration: Duration(seconds: 2)));
//         },
//         icon: const Icon(Icons.add))),
//         );
//   }
// }
