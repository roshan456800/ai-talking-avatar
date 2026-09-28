import 'package:flutter_test/flutter_test.dart';
import 'package:ai_talking_avatar/main.dart';

void main() {
  testWidgets('AI Talking Avatar app builds', (WidgetTester tester) async {
    await tester.pumpWidget(const TalkingAvatarApp());

    expect(find.text('AI Talking Avatar'), findsOneWidget);
  });
}
