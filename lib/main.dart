import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateProviderを定義して、初期値として0をセットします。
final counterProvider = StateProvider<int>((ref) => 0);

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // counterProviderを監視して、その値をUIに表示します。
    final int count = ref.watch(counterProvider);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Riverpod Counter Example')),
        body: Center(
          child: Text('Counter: $count'),
        ),
        floatingActionButton: FloatingActionButton(
          // ボタンが押されたときにcounterProviderの状態を更新します。
          onPressed: () => ref.read(counterProvider.notifier).state++,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
