import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/home_screen.dart';
import './providers/order.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // const MaterialColor kPrimaryColor = MaterialColor(
    //   0xff290cff,
    //   <int, Color>{
    //     50: Color(0xff290cff),
    //     100: Color(0xff290cff),
    //     200: Color(0xff290cff),
    //     300: Color(0xff290cff),
    //     400: Color(0xff290cff),
    //     500: Color(0xff290cff),
    //     600: Color(0xff290cff),
    //     700: Color(0xff290cff),
    //     800: Color(0xff290cff),
    //     900: Color(0xff290cff),
    //   },
    // );
    // const MaterialColor KAccentColor = MaterialColor(
    //   0xff5ec9c9,
    //   <int, Color>{
    //     50: Color(0xff5ec9c9),
    //     100: Color(0xff5ec9c9),
    //     200: Color(0xff5ec9c9),
    //     300: Color(0xff5ec9c9),
    //     400: Color(0xff5ec9c9),
    //     500: Color(0xff5ec9c9),
    //     600: Color(0xff5ec9c9),
    //     700: Color(0xff5ec9c9),
    //     800: Color(0xff5ec9c9),
    //     900: Color(0xff5ec9c9),
    //   },
    // );

    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          accentColor: Colors.teal,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
