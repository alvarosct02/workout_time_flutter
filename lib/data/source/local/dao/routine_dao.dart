import 'package:workout_timer/data/models/routine.dart';

import 'base_dao.dart';

class RoutineDao extends BaseDao<Routine> {
  static const String TABLE_NAME = "Routine";

  static const String FIELD_ID = "id";
  static const String FIELD_PLAN_ID = "plan_id";
  static const String FIELD_NAME = "name";
  static const String FIELD_RAW_SETS = "raw_sets";

  @override
  String onCreateStatement() {
    return '''
      CREATE TABLE $TABLE_NAME (
        $FIELD_ID INTEGER NOT NULL,
        $FIELD_PLAN_ID INTEGER NOT NULL,
        $FIELD_NAME TEXT NOT NULL,
        $FIELD_RAW_SETS TEXT NOT NULL,
        PRIMARY KEY ($FIELD_ID, $FIELD_PLAN_ID)
      );
    ''';
  }

  @override
  String getTableName() => TABLE_NAME;

  @override
  List<String> getPrimaryKeys() => [FIELD_ID, FIELD_PLAN_ID];

  @override
  Map<String, dynamic> mapObjectToRow(Routine obj) => {
        FIELD_ID: obj.id,
        FIELD_PLAN_ID: obj.planId,
        FIELD_NAME: obj.name,
        FIELD_RAW_SETS: obj.sets.map((it) => ),
      };

  @override
  Routine mapRowToObject(Map<String, dynamic> row) {
    return Routine(
      row[FIELD_ID],
      row[FIELD_NAME],
    )..planId = row[FIELD_PLAN_ID]
    ..planId = row[FIELD_PLAN_ID];
  }
}
