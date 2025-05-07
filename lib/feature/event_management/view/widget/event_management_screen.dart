import 'package:flutter/material.dart';
import 'package:training_management/feature/event_management/model/event.dart';
import 'package:training_management/feature/event_management/view/widget/search_field.dart';

class EventManagementScreen extends StatelessWidget {
  const EventManagementScreen({super.key, required this.event});
  final Event event;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: event.slotGroups.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(event.categoryName),
          bottom: TabBar(
            tabs:
                event.slotGroups
                    .map((slot) => Tab(text: slot.slotGroupName))
                    .toList(),
          ),
        ),
        body: ListView(padding: EdgeInsets.all(16), children: [SearchField()]),
      ),
    );
  }
}
