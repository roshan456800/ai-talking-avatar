import 'package:firebase_ai/firebase_ai.dart';

class GeminiService {
  late final GenerativeModel _model;

  GeminiService() {
    _model = FirebaseAI.googleAI().generativeModel(
      model: 'gemini-3.7-flash',
    );
  }

  Future<String> sendMessage(String message) async {
    final response = await _model.generateContent([
      Content.text(message),
    ]);

    return response.text ?? 'मुझे कोई जवाब नहीं मिला।';
  }
}
