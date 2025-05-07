import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_management/core/data/event_data.dart';
import 'package:training_management/feature/event_management/model/event.dart';

final eventManagementRepositoryProvider = Provider.autoDispose((ref) {
  return EventManagementRepository(eventData: ref.watch(eventDataProvider));
});

class EventManagementRepository {
  final EventData _eventData;

  EventManagementRepository({required EventData eventData})
    : _eventData = eventData;

  Future<Event> getEventDetails() async {
    final response = await _eventData.getEventData();
    return Event.fromJson(response);
  }
}
