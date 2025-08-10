import 'package:crazycar/core/class/supabase_connect.dart';

class RiderHomeApi {
  static rpc(String nameFun, Map<String, dynamic>? params) async {
    return SupabaseConnect.supabase.rpc(nameFun, params: params);
  }

  static insert(String table, Map data) async {
    return SupabaseConnect.supabase.from(table).insert(data).select("id");
  }

  static selectEq(
    String table,
    String selectColumn,
    String column,
    int value,
  ) async {
    return SupabaseConnect.supabase
        .from(table)
        .select(selectColumn)
        .eq(column, value);
  }
}
