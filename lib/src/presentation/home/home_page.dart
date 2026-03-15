import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = '/';
  static const name = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: Center(child: Text('HomePage')));
  }
}
