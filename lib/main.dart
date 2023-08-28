import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import 'inflastracture/firebase/counter/counter_repository.dart';
import 'presentation/app.dart';
import 'util/logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ProviderScope(
      observers: [
        ProviderLogger(),
      ],
      child: const App(),
    ),
  );
}

class TestConsumer extends ConsumerWidget {
  const TestConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/animations/not_found.json',
          width: 150,
          height: 150,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.watch(firebaseFirestoreRepositoryProvider).fetchSnapshot(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
