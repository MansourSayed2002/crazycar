import 'dart:io';

import 'package:crazycar/core/class/supabase_connect.dart';

class AuthApi {
  static insert(String table, data) async {
    var result =
        await SupabaseConnect.supabase.from(table).insert(data).select();
    return result;
  }

  static selectEq(String table, String column, String value) async {
    var response = await SupabaseConnect.supabase
        .from(table)
        .select()
        .eq(column, value);
    return response;
  }

  static updateEq(String table, Map data, String column, String value) async {
    var response = await SupabaseConnect.supabase
        .from(table)
        .update(data)
        .eq(column, value);
    return response;
  }

  static selectFilter(
    String table,
    String selectcolumn,
    String column,
    String value,
  ) async {
    var response = await SupabaseConnect.supabase
        .from(table)
        .select(selectcolumn)
        .filter(column, "eq", value);
    return response;
  }

  static uploadFile(String buckets, String path, File file) async {
    await SupabaseConnect.supabase.storage.from(buckets).upload(path, file);
  }
}
