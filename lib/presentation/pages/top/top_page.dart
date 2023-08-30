import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/buttons/routing_app_buttons.dart';
import 'top_page_image.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Launch App!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            const TopPageImage(),
            const SizedBox(height: 60),
            RoutingAppButtons.toSignUp(),
            const SizedBox(height: 30),
            RoutingAppButtons.toSignIn(),
          ],
        ),
      ),
    );
  }
}
