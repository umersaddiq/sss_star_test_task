import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../mixins/localization_mixin.dart';
import 'widgets/explore_view.dart';
import 'widgets/for_you_view.dart';
import 'widgets/home_tab_bar.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = '/';
  static const name = '/';

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with LocalizationMixin, SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: HomeTabBar(
            tabController: _tabController,
            tabs: [lang.forYou, lang.explore],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ForYouView(),
          ExploreView(),
        ],
      ),
    );
  }
}
