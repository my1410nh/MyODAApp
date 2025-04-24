// lib/test/login_screen_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myodaapp/view/auth/login_screen.dart';
import 'package:myodaapp/viewmodel/login_viewmodel.dart';
import 'package:myodaapp/data/api_services.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';
import 'package:myodaapp/test/mocks/mock.dart';  // Import the MockApiService

void main() {
  group('Login Screen Test', () {
    testWidgets('displays login screen and performs login', (WidgetTester tester) async {
      // Create an instance of MockApiService
      final mockApiService = MockApiService();
      
      // Mock the API response for a successful login (return a nullable String? token)
      when(mockApiService.authenticate(any as String, any as String))
          .thenAnswer((_) async => Future.value('mocked_token'));  // Return a mocked token on success

      // Build the LoginScreen with the mock LoginViewModel
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<LoginViewModel>(
            create: (_) => LoginViewModel(),
            child: LogInScreen(),
          ),
        ),
      );

      // Enter valid credentials
      await tester.enterText(find.byType(TextFormField).at(0), 'testuser@example.com');
      await tester.enterText(find.byType(TextFormField).at(1), 'Test@1234');

      // Tap on the login button
      await tester.tap(find.text('Login'));
      await tester.pump();

      // Verify that the login API was called with correct parameters
      verify(mockApiService.authenticate('testuser@example.com', 'Test@1234')).called(1);

      // Verify the user is redirected to Home Screen after successful login
      expect(find.text('Home Screen'), findsOneWidget);
    });

    testWidgets('shows error message on invalid credentials', (WidgetTester tester) async {
      // Mock the API response for failed login (return null for failed login)
      final mockApiService = MockApiService();
      when(mockApiService.authenticate(any as String, any as String))
        .thenAnswer((_) async => null);

      // Build the LoginScreen with the mock LoginViewModel
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<LoginViewModel>(
            create: (_) => LoginViewModel(),
            child: LogInScreen(),
          ),
        ),
      );

      // Enter invalid credentials
      await tester.enterText(find.byType(TextFormField).at(0), 'wrongemail@example.com');
      await tester.enterText(find.byType(TextFormField).at(1), 'WrongPassword');

      // Tap on the login button
      await tester.tap(find.text('Login'));
      await tester.pump();

      // Verify the login failure and show the error message
      expect(find.text('Invalid email or password'), findsOneWidget);
    });
  });
}
