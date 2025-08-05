import 'package:crazycar/core/class/supabase_connect.dart';

class RiderHomeApi {
  static getNearbyDrivers(Map<String, dynamic>? params) async {
    return SupabaseConnect.supabase.rpc("get_nearby_drivers", params: params);
  }
}
