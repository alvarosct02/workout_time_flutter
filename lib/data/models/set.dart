
import 'exercice.dart';

class Set {
  double totalDuration;
  int totalRounds;
  int type;
  double breakTime;
  List<Exercice> exercices;

  Set(
    this.totalDuration,
    this.totalRounds,
    this.type,
    this.breakTime,
    this.exercices,
  );
  static Set fromJson(Map<String, dynamic> json) {
    return Set(
      json['total_duration'],
      json['total_rounds'],
      json['type'],
      json['break_time'],
      (json['exercices'] as List)
        .map((it) => Exercice.fromJson(it))
        .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_duration': totalDuration,
      'total_rounds': totalRounds,
      'type': type,
      'break_time': breakTime,
      'exercices': exercices.map((it) => it.toJson()).toList(),
    };
  }
}
