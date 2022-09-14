import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shopping_app/layout.dart';
import 'package:shopping_app/pages/account.dart';
import 'package:shopping_app/pages/home/home.dart';

import 'layout_test.mocks.dart';

class DummyWidget extends StatelessWidget {
  const DummyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

@GenerateMocks([NavigatorState])
void main() {
  testWidgets('should navigate to Home page on tap of home in the side drawer',
      (WidgetTester tester) async {
    final mockNavigatorState = MockNavigatorState();
    var materialPageRoute = MaterialPageRoute(
      builder: (context) => const Home(),
    );
    when(mockNavigatorState.push(any))
        .thenAnswer((_) async => materialPageRoute);

    await tester.pumpWidget(MaterialApp(
      home: Layout(
        navigatorState: mockNavigatorState,
        child: const DummyWidget(),
      ),
    ));

    final ScaffoldState state =
        tester.firstState(find.byKey(const Key('app-scaffold')));

    state.openDrawer();

    await tester.pumpAndSettle();

    await tester.tap(find.text("Home"));

    await tester.pumpAndSettle();

    verify(mockNavigatorState.push(any));
  });
}
