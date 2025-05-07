import 'dart:convert';

import 'package:flutter/services.dart';

abstract class EventData {
  Future<Map<String, dynamic>> getEventData();
}

class EventLocalDataImpl implements EventData {
  @override
  Future<Map<String, dynamic>> getEventData() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/event_data.json',
    );
    return json.decode(jsonString);
  }
}
