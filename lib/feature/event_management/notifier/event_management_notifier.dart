import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_management/feature/event_management/notifier/event_management_state.dart';
import 'package:training_management/feature/event_management/repository/event_management_repository.dart';

final eventManagementNotifierProvider = StateNotifierProvider.autoDispose((
  ref,
) {
  return EventManagementNotifier(
    repository: ref.watch(eventManagementRepositoryProvider),
  ).._init();
});

class EventManagementNotifier extends StateNotifier<EventManagementState> {
  final EventManagementRepository _repository;

  EventManagementNotifier({required EventManagementRepository repository})
    : _repository = repository,
      super(EventManagementState());

  Future<void> _init() async {
    state = state.copyWith(loadingState: Loading());
    final event = await _repository.getEventDetails();
    state = state.copyWith(loadingState: Success(event: event));
  }
}
