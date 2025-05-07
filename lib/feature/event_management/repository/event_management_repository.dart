import 'package:training_management/core/data/event_data.dart';

class EventManagementRepository {
  final EventData eventData;

  EventManagementRepository({required this.eventData});
  Future getEventDetails() async {
    await eventData.getEventData();
  }
}
