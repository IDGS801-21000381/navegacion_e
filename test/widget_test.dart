import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:navegacion_e/main.dart';
import 'package:navegacion_e/registration_screen.dart';
import 'package:navegacion_e/display_screen.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues(
        {}); // Reset the shared preferences before each test
  });

  testWidgets('Displays saved name on DisplayScreen',
      (WidgetTester tester) async {
    // Set a name in shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('nombre', 'Test Name');

    // Build our app and trigger a frame.
    await tester
        .pumpWidget(MyApp(savedName: 'Test Name', userRegistered: true));

    // Verify that the DisplayScreen shows the saved name
    expect(find.text('Hola, Test Name!'), findsOneWidget);
  });

  testWidgets('Shows registration screen if no name is saved',
      (WidgetTester tester) async {
    // Ensure no name is set in shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('nombre');

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(savedName: null, userRegistered: false));

    // Verify that the RegistrationScreen is shown
    expect(find.byType(RegistrationScreen), findsOneWidget);
  });

  testWidgets('Allows saving a name on RegistrationScreen',
      (WidgetTester tester) async {
    // Ensure no name is set in shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('nombre');

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(savedName: null, userRegistered: false));

    // Enter a name and save it
    await tester.enterText(find.byType(TextField).first, 'New Name');
    await tester.tap(find.text('Guardar'));
    await tester.pumpAndSettle();

    // Verify that the DisplayScreen is shown with the new name
    expect(find.text('Hola, New Name!'), findsOneWidget);
    expect(find.byType(DisplayScreen), findsOneWidget);
  });
}
