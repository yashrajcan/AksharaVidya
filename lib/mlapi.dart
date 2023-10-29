import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class mlapi with ChangeNotifier {
  Future<void> post(
      int language_vocab,
      int memory,
      int speed,
      int visual_discrimination,
      int audio_discrimination,
      int survey_score) async {
    final uri = Uri.parse(
        'https://yashrajsingh.ap-south-1.modelbit.com/v1/my_lr_deployment/latest');
    final Map<String, dynamic> data = {
      'language_vocablary': 2,
      'memory': 2,
      'speed': 2,
      'visual_discrimination': 2,
      'audio_discrimination': 2,
      'survey_score': 2,
    };

    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.post(
        uri,
        headers: headers,
        body: json.encode(data),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      notifyListeners();
    } catch (e) {
      print('Error sending HTTP request: $e');
    }
  }
}
