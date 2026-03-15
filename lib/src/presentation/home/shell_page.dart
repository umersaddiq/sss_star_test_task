import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sss_star_test_task/src/base/l10n/app_localizations.dart';
import '../../gen/assets.gen.dart';
import '../../mixins/localization_mixin.dart';
import '../../widget/typography/sf_pro_text_widget.dart';
import 'cart_page.dart';
import 'home_page.dart';
import 'profile_page.dart';

class ShellPage extends ConsumerStatefulWidget {
  const ShellPage.builder(
    BuildContext _,
    GoRouterState _,
    Widget child, {
    super.key,
  }) : _child = child;

  final Widget _child;

  @override
  ConsumerState<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends ConsumerState<ShellPage> with LocalizationMixin {
  double _opacity = 1.0;
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    return Scaffold(
      extendBody: true,
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            if (notification.scrollDelta! > 10 && _isVisible) {
              _isVisible = false;
              _opacity = 0.35;
              setState(() {});
            } else if (notification.scrollDelta! < -10 && !_isVisible) {
              _isVisible = true;
              _opacity = 1.0;
              setState(() {});
            }
          }
          return false;
        },
        child: widget._child,
      ),
      bottomNavigationBar: AnimatedOpacity(
        duration: const .new(milliseconds: 300),
        opacity: _opacity,
        child: _CustomBottomNavBar(
          lang: lang,
          currentLocation: location,
          onTap: (index) {
            context.goNamed(switch (index) {
              1 => CartPage.name,
              2 => ProfilePage.name,
              _ => HomePage.name,
            });
            _isVisible = true;
            _opacity = 1.0;
            setState(() {});
          },
        ),
      ),
    );
  }
}

class _CustomBottomNavBar extends StatelessWidget {
  const _CustomBottomNavBar({
    required this.currentLocation,
    required this.onTap,
    required this.lang,
  });

  final String currentLocation;
  final ValueChanged<int> onTap;
  final AppLocalizations lang;

  static const double _height = 102.0;
  static const Color _activeColor = .new(0xFF0079FF);
  static const Color _inactiveColor = .new(0xFFC1CEDC);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          .new(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const .new(0, -5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const .vertical(top: .circular(40)),
        child: BackdropFilter(
          filter: ColorFilter.mode(
            Colors.white.withValues(alpha: .1),
            .srcOver,
          ),
          child: Padding(
            padding: const .only(top: 15),
            child: Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                _NavBarItem(
                  icon: Assets.icons.shopIcon,
                  label: lang.shop,
                  isSelected: currentLocation == HomePage.path,
                  onTap: () => onTap(0),
                ),
                _NavBarItem(
                  icon: Assets.icons.cartIcon,
                  label: lang.cart,
                  isSelected: currentLocation == CartPage.path,
                  onTap: () => onTap(1),
                ),
                _NavBarItem(
                  icon: Assets.icons.usernameIconGreyed,
                  label: lang.profile,
                  isSelected: currentLocation == ProfilePage.path,
                  onTap: () => onTap(2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  const _NavBarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final SvgGenImage icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? _CustomBottomNavBar._activeColor
        : _CustomBottomNavBar._inactiveColor;

    return GestureDetector(
      onTap: onTap,
      behavior: .opaque,
      child: Column(
        mainAxisSize: .min,
        children: [
          icon.svg(
            color: color,
            colorFilter: ColorFilter.mode(color, .srcIn),
            height: 24,
          ),
          const SizedBox(height: 8),
          SfProText(label, weight: 600, color: color),
        ],
      ),
    );
  }
}
