import 'package:flutter/material.dart';
import 'package:training_management/feature/event_management/model/event.dart';

class EventManagementScreen extends StatefulWidget {
  const EventManagementScreen({super.key, required this.event});
  final Event event;

  @override
  State<EventManagementScreen> createState() => _EventManagementScreenState();
}

class _EventManagementScreenState extends State<EventManagementScreen> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width;
    final textFieldWidth = isVisible ? totalWidth * 0.75 : totalWidth;

    return DefaultTabController(
      length: widget.event.slotGroups.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.event.categoryName),
          bottom: TabBar(
            tabs:
                widget.event.slotGroups
                    .map((slot) => Tab(text: slot.slotGroupName))
                    .toList(),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Stack(
              children: [
                AnimatedContainer(
                  width: textFieldWidth,
                  height: 32,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: TextField(
                    onTap: () {
                      if (isVisible) return;
                      isVisible = true;
                      setState(() {});
                    },
                    cursorHeight: 14,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade300,
                      hintText: 'Search',
                      filled: true,
                      prefixIcon: Icon(
                        Icons.search,
                        size: 22,
                        color: Colors.black45,
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.all(4).copyWith(left: 8),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  right: isVisible ? 0 : -100,
                  bottom: 0,
                  top: 0,
                  child: TextButton(
                    onPressed: () {
                      isVisible = false;
                      setState(() {});
                    },
                    child: Text('Cancel'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
