import 'package:flutter/material.dart';
import 'package:training_management/feature/event_management/model/event.dart';
import 'package:training_management/feature/event_management/view/widget/resource_tile_view.dart';
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            SearchField(),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: TabBarView(
                  children:
                      event.slotGroups
                          .map(
                            (slot) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                SizedBox(height: 20),
                                ...slot.resources.map(
                                  (resource) =>
                                      ResourceTileView(resource: resource),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
