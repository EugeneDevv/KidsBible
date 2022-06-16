// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kids_bible/counter/state/state_prodiver.dart';
import 'package:kids_bible/l10n/l10n.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CounterView(
      ref: ref,
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key, required this.ref});
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: Center(
        child: CounterText(
          count: counter.toString(),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: const Key('btn_add'),
            onPressed: () => ref.read(counterProvider.notifier).state++,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('btn_remove'),
            onPressed: () => ref.read(counterProvider.notifier).state--,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key, required this.count});
  final String count;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(count, style: theme.textTheme.headline1);
  }
}
