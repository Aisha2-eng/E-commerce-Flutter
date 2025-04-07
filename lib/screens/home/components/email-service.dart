import 'dart:convert';
import 'package:http/http.dart' as http;

class EmailService {
  final String serviceId = 'service_7o4fzgn';
  final String templateId = 'template_ae4fji9';
  final String userId = '3utpEi5L2w2bw-lZn';

  Future<void> sendEmail({
    required String name,
    required String email,
    required String message,
  }) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'message': message,
        },
      }),
    );

    if (response.statusCode == 200) {
      print('Email sent successfully!');
    } else {
      print('Failed to send email: ${response.body}');
      throw Exception('Failed to send email');
    }
  }
}
