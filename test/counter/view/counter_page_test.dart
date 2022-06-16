// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kids_bible/counter/view/counter_page.dart';

import '../../helpers/helpers.dart';

void main() {
  group('CounterPage', () {
    testWidgets('renders CounterView', (tester) async {
      await tester.pumpApp(const ProviderScope(child: CounterPage()));
      expect(find.byType(CounterView), findsOneWidget);
    });

    testWidgets('update the UI when incrementing the state', (tester) async {
      await tester.pumpApp(const ProviderScope(child: CounterPage()));
      expect(find.byType(CounterView), findsOneWidget);

       // The default value is `0`, as declared in our provider
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Increment the state and re-render
      await tester.tap(find.byKey(const Key('btn_add')));
      await tester.pump();

      // The state have properly incremented
      expect(find.text('1'), findsOneWidget);
      expect(find.text('0'), findsNothing);

      // Decrement the state and re-render
      await tester.tap(find.byKey(const Key('btn_remove')));
      await tester.pump();

      // The state have properly incremented
      expect(find.text('0'), findsOneWidget);

      // Decrement the state and re-render
      await tester.tap(find.byKey(const Key('btn_remove')));
      await tester.pump();

      // The state have properly incremented
      expect(find.text('-1'), findsOneWidget);
    });
  });
}
