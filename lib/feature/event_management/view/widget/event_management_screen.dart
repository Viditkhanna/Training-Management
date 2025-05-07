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
        body: Padding(
          padding: EdgeInsets.all(16),

          child: Column(
            children: [
              SearchField(),
              Expanded(
                child: TabBarView(
                  children:
                      event.slotGroups
                          .map(
                            (slot) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Event: ',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: event.eventName,
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ...slot.resources.map(
                                  (resource) => ListTile(
                                    title: Text(resource.firstName),
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
