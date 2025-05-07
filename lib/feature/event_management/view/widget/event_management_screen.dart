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
              SizedBox(height: 20),
              Expanded(
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
            ],
          ),
        ),
      ),
    );
  }
}

class ResourceTileView extends StatelessWidget {
  const ResourceTileView({super.key, required this.resource});
  final Resource resource;

  @override
  Widget build(BuildContext context) {
    if (resource.certificates.isEmpty) {
      return ListTile(
        leading: _ResourceImage(imageUrl: resource.photo),
        subtitle: Text(resource.userId),
        title: Text('${resource.firstName} ${resource.name}'),
        contentPadding: EdgeInsets.zero.copyWith(left: 4),
      );
    } else {
      return ExpansionTile(
        title: Text('${resource.firstName} ${resource.name}'),
        childrenPadding: EdgeInsets.zero,
        tilePadding: EdgeInsets.zero.copyWith(left: 4),
        shape: Border(),
        leading: _ResourceImage(imageUrl: resource.photo),
        subtitle: Text(resource.userId),
        children: [
          Container(
            color: Colors.blue,
            padding: EdgeInsets.all(4),
            width: MediaQuery.of(context).size.width,
            child: Text('Certificates', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 8),
          ...resource.certificates
              .map(
                (certificate) => Align(
                  alignment: Alignment.centerLeft,
                  child: Text(certificate),
                ),
              )
              .expand((e) => [e, Divider(color: Colors.grey, thickness: 0.4)])
              .toList()
            ..removeLast(),
        ],
      );
    }
  }
}

class _ResourceImage extends StatelessWidget {
  const _ResourceImage({required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey, strokeAlign: 5),
        image: DecorationImage(image: NetworkImage(imageUrl)),
      ),
    );
  }
}
