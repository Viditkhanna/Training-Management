import 'package:training_management/feature/event_management/model/event.dart';

class EventManagementState {
  final LoadingState loadingState;
  final Event? event;

  EventManagementState({this.loadingState = const Initial(), this.event});

  EventManagementState copyWith({LoadingState? loadingState, Event? event}) {
    return EventManagementState(
      loadingState: loadingState ?? this.loadingState,
      event: event ?? this.event,
    );
  }
}

sealed class LoadingState {
  const LoadingState();
}

class Initial extends LoadingState {
  const Initial();
}

class Loading extends LoadingState {
  const Loading();
}

class Success extends LoadingState {
  final Event event;

  const Success({required this.event});
}

class Failure extends LoadingState {
  final Exception exception;

  const Failure({required this.exception});
}
