import 'dart:convert';

import 'package:workout_timer/data/models/plan.dart';
import 'package:workout_timer/data/source/local/dao/plan_dao.dart';
import 'package:workout_timer/data/source/local/dao/routine_dao.dart';

class DataRepository {
  // final RequestManager api = RequestManager();
  final PlanDao _planDao = PlanDao();
  final RoutineDao _routineDao = RoutineDao();
  // final QuestionDao questionDao = QuestionDao();
  // final AnswerDao answerDao = AnswerDao();
  // final PreferenceManager preferenceManager = PreferenceManager();

  Future<List<Plan>> getPlansLocally() {
    return _planDao.queryAllRows();
  }

  void loadRoutinePlanFile(String data) async {
    final jsonResult = json.decode(data);
    for (var planJson in jsonResult) {
      var plan = Plan.fromJson(planJson);
      await _planDao.insert(plan);
      for (var routine in plan.rutines) {
        await _routineDao.insert(routine);
      }
    }
  }
}
