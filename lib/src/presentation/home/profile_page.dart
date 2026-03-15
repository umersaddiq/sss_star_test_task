import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = '/profile';
  static const name = '/profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(child: Text('Profile Page'));
  }
}
