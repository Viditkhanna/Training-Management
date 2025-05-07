import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final eventDataProvider = Provider.autoDispose((ref) => EventLocalDataImpl());

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
