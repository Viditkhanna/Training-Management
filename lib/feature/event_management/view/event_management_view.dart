import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_management/feature/event_management/model/event.dart';
import 'package:training_management/feature/event_management/notifier/event_management_notifier.dart';
import 'package:training_management/feature/event_management/notifier/event_management_state.dart';

class EventManagementView extends ConsumerWidget {
  const EventManagementView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.watch(eventManagementNotifierProvider);

    return Scaffold(
      body: switch (event.loadingState) {
        Initial<Event>() => SizedBox.shrink(),
        Loading<Event>() => Center(child: CircularProgressIndicator()),
        Success<Event>(event: Event event) => ListView(children: []),
        Failure<Event>(exception: Exception exception) => Center(
          child: Text(exception.toString()),
        ),
      },
    );
  }
}
