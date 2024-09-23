import 'package:flutter/material.dart';
import 'package:todo_list_app/To_Do_ListScreen.dart';
import 'package:google_fonts/google_fonts.dart'; // Import for custom fonts

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TO_DO LIST App',
      theme: ThemeData(
         primaryColor: Colors.deepPurple, // Consistent theme
        scaffoldBackgroundColor: Colors.white, // Lighter background
        textTheme: GoogleFonts.poppinsTextTheme(), // Custom Font
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
        ),
        useMaterial3: true,
      ),
      
      home: const To_dO_list(),
      
    );
  }
}




