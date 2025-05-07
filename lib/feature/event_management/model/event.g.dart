// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
  categoryName: json['categoryName'] as String,
  eventName: json['eventName'] as String,
  slotGroups:
      (json['slotGroups'] as List<dynamic>)
          .map((e) => SlotGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
  'categoryName': instance.categoryName,
  'eventName': instance.eventName,
  'slotGroups': instance.slotGroups.map((e) => e.toJson()).toList(),
};

SlotGroup _$SlotGroupFromJson(Map<String, dynamic> json) => SlotGroup(
  slotGroupName: json['slotGroupName'] as String,
  resources:
      (json['resources'] as List<dynamic>)
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$SlotGroupToJson(SlotGroup instance) => <String, dynamic>{
  'slotGroupName': instance.slotGroupName,
  'resources': instance.resources.map((e) => e.toJson()).toList(),
};

Resource _$ResourceFromJson(Map<String, dynamic> json) => Resource(
  firstName: json['firstName'] as String,
  name: json['name'] as String,
  userId: json['userId'] as String,
  photo: json['photo'] as String,
  certificates:
      (json['certificates'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$ResourceToJson(Resource instance) => <String, dynamic>{
  'firstName': instance.firstName,
  'name': instance.name,
  'userId': instance.userId,
  'photo': instance.photo,
  'certificates': instance.certificates,
};
