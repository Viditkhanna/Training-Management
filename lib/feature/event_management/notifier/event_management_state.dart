import 'package:training_management/feature/event_management/model/event.dart';

class EventManagementState {
  final LoadingState<Event> loadingState;

  EventManagementState({this.loadingState = const Initial()});

  EventManagementState copyWith({LoadingState<Event>? loadingState}) {
    return EventManagementState(
      loadingState: loadingState ?? this.loadingState,
    );
  }
}

sealed class LoadingState<T> {
  const LoadingState();
}

class Initial<T> extends LoadingState<T> {
  const Initial();
}

class Loading<T> extends LoadingState<T> {
  const Loading();
}

class Success<T> extends LoadingState<T> {
  final T event;

  const Success({required this.event});
}

class Failure<T> extends LoadingState<T> {
  final Exception exception;

  const Failure({required this.exception});
}
