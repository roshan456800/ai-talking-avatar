import 'package:flutter/material.dart';
import 'gemini_service.dart';

void main() {
  runApp(const TalkingAvatarApp());
}

class TalkingAvatarApp extends StatelessWidget {
  const TalkingAvatarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Talking Avatar',
      theme: ThemeData.dark(),
      home: const AvatarHomePage(),
    );
  }
}

class AvatarHomePage extends StatefulWidget {
  const AvatarHomePage({super.key}); 

  @override
  State<AvatarHomePage> createState() => _AvatarHomePageState();
}

class _AvatarHomePageState extends State<AvatarHomePage> {
  final TextEditingController _controller = TextEditingController();
  late final GeminiService _gemini;

  String _message = 'Hello! I am your AI assistant.';

  Future<void> _sendMessage() async {
  final text = _controller.text.trim();

  if (text.isEmpty) return;

  setState(() {
    _message = 'Thinking...';
    _controller.clear();
  });

  try {
    final reply = await _gemini.sendMessage(text);

    if (!mounted) return;

    setState(() {
      _message = reply;
    });
  } catch (e) {
    if (!mounted) return;

    setState(() {
      _message = 'Sorry, something went wrong.';
    });
  }
  }
  
 @override
 void initState() {
  super.initState();
  _gemini = GeminiService();
 }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),

            const Text(
              'AI Talking Avatar',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Spacer(),

            Container(
              width: 220,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(110),
                border: Border.all(
                  color: Colors.white24,
                  width: 2,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.face_3,
                  size: 120,
                  color: Colors.white70,
                ),
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                _message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Ask something...',
                        hintStyle:
                            const TextStyle(color: Colors.white54),
                        filled: true,
                        fillColor: Colors.white10,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  FloatingActionButton(
                    onPressed: _sendMessage,
                    child: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
