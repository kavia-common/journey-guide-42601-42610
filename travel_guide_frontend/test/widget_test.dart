import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:travel_guide_frontend/main.dart';

void main() {
  testWidgets('App launches with Explore tab and NavigationBar', (WidgetTester tester) async {
    await tester.pumpWidget(const TravelGuideApp());
    await tester.pumpAndSettle();

    // App bar shows "Explore" initially and NavigationBar is present
    expect(find.text('Explore'), findsOneWidget);
    expect(find.byType(NavigationBar), findsOneWidget);
  });

  testWidgets('Navigates between tabs smoothly', (WidgetTester tester) async {
    await tester.pumpWidget(const TravelGuideApp());
    await tester.pumpAndSettle();

    // Tap on Recommendations tab
    await tester.tap(find.byIcon(Icons.thumb_up_off_alt));
    await tester.pumpAndSettle();
    expect(find.text('Recommendations'), findsOneWidget);

    // Tap on Reviews tab
    await tester.tap(find.byIcon(Icons.reviews_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Reviews'), findsOneWidget);

    // Back to Plan tab
    await tester.tap(find.byIcon(Icons.event_note_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Plan'), findsOneWidget);
  });
}
