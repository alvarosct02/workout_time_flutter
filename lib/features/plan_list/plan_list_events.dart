import 'package:workout_timer/data/models/plan.dart';

abstract class PlanListEvent {}

class OnDataEvent extends PlanListEvent {
  List<Plan> planList;
  OnDataEvent(this.planList);
}

class OnErrorEvent extends PlanListEvent {
  String message;
  OnErrorEvent(this.message);
}
