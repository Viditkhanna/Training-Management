import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'feature/event_management/view/event_management_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const font = 'SourceSansPro';

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Event',
        theme: ThemeData(
          fontFamily: font,
          primaryColor: Colors.black,
          colorScheme: ColorScheme.light(primary: Colors.black),
          tabBarTheme: TabBarTheme(
            unselectedLabelColor: Colors.grey,
            dividerColor: Colors.grey,
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: font,
              fontSize: 16,
            ),
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: font,
              fontSize: 16,
            ),
            dividerHeight: 0.2,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: font,
            ),
          ),
        ),
        home: const EventManagementView(),
      ),
    );
  }
}
