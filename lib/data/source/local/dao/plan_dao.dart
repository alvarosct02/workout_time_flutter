import 'package:workout_timer/data/models/plan.dart';
import 'base_dao.dart';

class PlanDao extends BaseDao<Plan> {
  static const String TABLE_NAME = "Plan";

  static const String FIELD_ID = "id";
  static const String FIELD_NAME = "name";
  static const String FIELD_REFERENCE = "reference";
  static const String FIELD_FAVORITE = "favorite";

  @override
  String onCreateStatement() {
    return '''
      CREATE TABLE $TABLE_NAME (
        $FIELD_ID INTEGER PRIMARY KEY,
        $FIELD_NAME TEXT NOT NULL,
        $FIELD_REFERENCE TEXT,
        $FIELD_FAVORITE INTEGER NOT NULL
      );
    ''';
  }

  @override
  String getTableName() => TABLE_NAME;

  @override
  List<String> getPrimaryKeys() => [FIELD_ID];

  @override
  Map<String, dynamic> mapObjectToRow(Plan obj) => {
        FIELD_ID: obj.id,
        FIELD_NAME: obj.name,
        FIELD_REFERENCE: obj.reference,
        FIELD_FAVORITE: obj.favorite
      };

  @override
  Plan mapRowToObject(Map<String, dynamic> row) {
    return Plan(
      row[FIELD_ID],
      row[FIELD_NAME],
      row[FIELD_REFERENCE],
      row[FIELD_FAVORITE],
    );
  }
}
