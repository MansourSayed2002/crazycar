import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:http/http.dart" as http;

Future sendVerifyCode({
  required String email,
  required String message,
}) async {
  String serviceId = dotenv.env['EMAILJS_SERVICE_ID']!;
  String templateId = dotenv.env['EMAILJS_TEMPLATE_ID']!;
  String userId = dotenv.env['EMAILJS_USER_ID']!;
  String token = dotenv.env['EMAILJS_TOKEN']!;

  String url = dotenv.env['EMAILJS_URL']!;

  await http.post(Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "service_id": serviceId,
        "template_id": templateId,
        "user_id": userId,
        "accessToken": token,
        "template_params": {
          "email": email,
          "message": message,
        }
      }));
}
