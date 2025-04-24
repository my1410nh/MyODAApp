import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myodaapp/view/auth/login_screen.dart';
import 'package:myodaapp/viewmodel/login_viewmodel.dart';
import 'package:myodaapp/data/api_services.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';
import 'package:myodaapp/test/mocks/mock.dart'; 

void main() {
  group('Login Screen Test', () {
    testWidgets('displays login screen and performs login', (WidgetTester tester) async {
      final mockApiService = MockApiService();
      
      when(mockApiService.authenticate(any as String, any as String))
          .thenAnswer((_) async => Future.value('mocked_token')); 

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<LoginViewModel>(
            create: (_) => LoginViewModel(),
            child: LogInScreen(),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField).at(0), 'testuser@example.com');
      await tester.enterText(find.byType(TextFormField).at(1), 'Test@1234');

      await tester.tap(find.text('Login'));
      await tester.pump();

      verify(mockApiService.authenticate('testuser@example.com', 'Test@1234')).called(1);

      expect(find.text('Home Screen'), findsOneWidget);
    });

    testWidgets('shows error message on invalid credentials', (WidgetTester tester) async {
      final mockApiService = MockApiService();
      when(mockApiService.authenticate(any as String, any as String))
        .thenAnswer((_) async => null);

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<LoginViewModel>(
            create: (_) => LoginViewModel(),
            child: LogInScreen(),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField).at(0), 'wrongemail@example.com');
      await tester.enterText(find.byType(TextFormField).at(1), 'WrongPassword');

      await tester.tap(find.text('Login'));
      await tester.pump();

      expect(find.text('Invalid email or password'), findsOneWidget);
    });
  });
}
