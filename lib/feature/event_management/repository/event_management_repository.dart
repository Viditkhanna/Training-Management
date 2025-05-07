import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_management/core/data/event_data.dart';

final eventManagementRepositoryProvider = Provider.autoDispose((ref) {
  return EventManagementRepository(eventData: ref.watch(eventDataProvider));
});

class EventManagementRepository {
  final EventData eventData;

  EventManagementRepository({required this.eventData});
  Future getEventDetails() async {
    await eventData.getEventData();
  }
}
