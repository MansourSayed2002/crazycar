import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConnect {
  SupabaseConnect._internal();
  static final SupabaseConnect instance = SupabaseConnect._internal();
  static SupabaseClient get supabase => Supabase.instance.client;
}
