import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable(explicitToJson: true)
class Event {
  final String categoryName;
  final String eventName;
  final List<SlotGroup> slotGroups;

  Event({
    required this.categoryName,
    required this.eventName,
    required this.slotGroups,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SlotGroup {
  final String slotGroupName;
  final List<Resource> resources;

  SlotGroup({required this.slotGroupName, required this.resources});

  factory SlotGroup.fromJson(Map<String, dynamic> json) =>
      _$SlotGroupFromJson(json);

  Map<String, dynamic> toJson() => _$SlotGroupToJson(this);
}

@JsonSerializable()
class Resource {
  final String firstName;
  final String name;
  final String userId;
  final String photo;
  final List<String> certificates;

  Resource({
    required this.firstName,
    required this.name,
    required this.userId,
    required this.photo,
    required this.certificates,
  });

  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceToJson(this);
}
