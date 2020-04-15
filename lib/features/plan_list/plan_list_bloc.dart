import 'package:workout_timer/data/source/data_repository.dart';
import 'package:workout_timer/features/base/base_bloc.dart';
import 'package:workout_timer/features/plan_list/plan_list_events.dart';

class PlanListBloc extends BaseBloc<PlanListEvent> {
  PlanListBloc(DataRepository repository) : super(repository);

  void listPlans() async {
    try {
      var routineList = await repository.getPlansLocally();
      addEvent(OnDataEvent(routineList));
    } catch (error) {
      addEvent(OnErrorEvent("Error"));
    }
  }

}