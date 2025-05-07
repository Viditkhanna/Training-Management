import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'feature/event_management/view/event_management_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Event',
        theme: ThemeData(
          fontFamily: 'SourceSansPro',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontFamily: 'SourceSansPro',
            ),
          ),
        ),
        home: const EventManagementView(),
      ),
    );
  }
}
