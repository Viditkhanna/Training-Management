import 'package:flutter/material.dart';
import 'package:training_management/feature/event_management/model/event.dart';

class EventManagementScreen extends StatelessWidget {
  const EventManagementScreen({super.key, required this.event});
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(event.categoryName)),
      body: DefaultTabController(
        length: event.slotGroups.length,
        child: ListView(
          children: [
            TabBar(
              tabs:
                  event.slotGroups
                      .map((slot) => Tab(text: slot.slotGroupName))
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
