import 'package:workout_timer/data/models/routine.dart';

class Plan {
  int id;
  String name;
  String reference;
  int favorite;
  List<Routine> rutines;

  Plan(
    this.id,
    this.name,
    this.reference,
    this.favorite,
  );

  static Plan fromJson(Map<String, dynamic> json) {
    return Plan(
      json['id'],
      json['name'],
      json['reference'],
      json['favorite'],
    )..rutines = (json['routines'] as List)
        .map((it) => Routine.fromJson(it)..planId = json['id'])
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'reference': reference,
      'favorite': favorite,
    };
  }
}
