import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_management/feature/event_management/model/event.dart';
import 'package:training_management/feature/event_management/notifier/event_management_notifier.dart';
import 'package:training_management/feature/event_management/notifier/event_management_state.dart';
import 'package:training_management/feature/event_management/view/widget/event_management_screen.dart';

class EventManagementView extends ConsumerWidget {
  const EventManagementView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.watch(eventManagementNotifierProvider);

    return switch (event.loadingState) {
      Initial<Event>() => Scaffold(body: SizedBox.shrink()),
      Loading<Event>() => Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      Success<Event>(event: Event event) => EventManagementScreen(event: event),
      Failure<Event>(exception: Exception exception) => Scaffold(
        body: Center(child: Text(exception.toString())),
      ),
    };
  }
}
