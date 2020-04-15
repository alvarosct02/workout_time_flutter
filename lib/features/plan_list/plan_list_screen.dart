import 'package:flutter/material.dart';
import 'package:workout_timer/data/models/plan.dart';
import 'package:workout_timer/data/source/data_repository.dart';
import 'package:workout_timer/features/base/base_state.dart';
import 'package:workout_timer/features/plan_list/plan_list_bloc.dart';
import 'package:workout_timer/features/plan_list/plan_list_events.dart';

class PlanListScreen extends StatefulWidget {
  @override
  _PlanListScreenState createState() => _PlanListScreenState();
}

class _PlanListScreenState
    extends BaseState<PlanListScreen, PlanListBloc> {
  List<Plan> _routineList;

  @override
  void setupBloc() async {
    bloc = PlanListBloc(DataRepository());
    bloc.eventObservable.listen((event) {
      setState(() {
        if (event is OnDataEvent) {
          isLoading = false;
          _routineList = event.planList;
        } else if (event is OnErrorEvent) {
          isLoading = false;
        }
      });
    });

    final json =
        await DefaultAssetBundle.of(context).loadString('assets/workout.json');
    DataRepository().loadRoutinePlanFile(json);

    bloc.listPlans();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Mis Rutinas 2",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline,
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: _routineList?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  var routine = _routineList[index];
                  return Container(
                    height: 50,
                    child: Center(child: Text('Entry ${routine.name}')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
