import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CartPage extends ConsumerWidget {
  const CartPage.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = '/cart';
  static const name = '/cart';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(child: Text('Cart Page'));
  }
}
