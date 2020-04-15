

import 'package:workout_timer/data/models/set.dart';

class Routine {
  int id;
  int planId;
  String name;
  List<Set> sets;

  Routine(
    this.id,
    this.name,
  );

  static Routine fromJson(Map<String, dynamic> json) {
    return Routine(
      json['id'],
      json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
