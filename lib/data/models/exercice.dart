
class Exercice {
  String name;
  double workTime;
  int reps;
  double breakTime;

  Exercice(
    this.name,
    this.workTime,
    this.reps,
    this.breakTime,
  );

  static Exercice fromJson(Map<String, dynamic> json) {
    return Exercice(
      json['name'],
      json['work_time'],
      json['reps'],
      json['break_time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'work_time': workTime,
      'reps': reps,
      'break_time': breakTime,
    };
  }
}
