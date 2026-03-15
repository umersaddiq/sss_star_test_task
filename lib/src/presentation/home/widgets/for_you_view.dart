import 'package:flutter/material.dart';
import '../../../base/theme/app_color.dart';
import '../../../mixins/localization_mixin.dart';
import '../../../widget/typography/sf_pro_text_widget.dart';

class ForYouView extends StatelessWidget {
  const ForYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const SizedBox(height: 20),
        _buildSearchBar(context),
        const SizedBox(height: 24),
        _buildFeatureCard(context),
        const SizedBox(height: 32),
        _buildForYouSection(context),
        const SizedBox(height: 32),
        _buildTrendingBrandsSection(context),
        const SizedBox(height: 120), // Padding for bottom nav bar
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Icon(Icons.search, color: Color(0xFFC1CEDC), size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: context.lang.searchYourProduct,
                hintStyle: const TextStyle(
                  color: Color(0xFFC1CEDC),
                  fontSize: 14,
                ),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.tune, color: AppColor.blueColor, size: 24),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 380,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            image: const DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=1000&auto=format&fit=crop'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        SfProText(
          context.lang.emergingDesigners.split(' ')[0],
          size: 44,
          weight: 900,
          color: AppColor.textColor,
        ),
        SfProText(
          context.lang.emergingDesigners.split(' ')[1],
          size: 44,
          weight: 700,
          color: AppColor.textColor,
          height: 0.8,
        ),
        const SizedBox(height: 12),
        SfProText(
          'Explore small businesses and discover unique, one-of-a-kind looks.',
          size: 16,
          weight: 600,
          color: AppColor.fadeTextColor,
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF031124),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 10,
            shadowColor: Colors.black.withValues(alpha: 0.5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SfProText(context.lang.shopNow, color: Colors.white, weight: 700, size: 16),
              const SizedBox(width: 40),
              const Icon(Icons.arrow_forward, color: Colors.white, size: 24),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildForYouSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SfProText('For You:', size: 20, weight: 700),
        const SizedBox(height: 16),
        SizedBox(
          height: 300,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                    image: NetworkImage('https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=1000&auto=format&fit=crop&index=$index'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTrendingBrandsSection(BuildContext context) {
    final lang = context.lang;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SfProText(lang.trendingBrands, size: 44, weight: 900),
        const SizedBox(height: 8),
        SfProText(
          'Loved by the community, picked by us — these brands are changing the game from the ground up.',
          size: 16,
          weight: 600,
          color: AppColor.fadeTextColor,
        ),
        const SizedBox(height: 24),
        _buildBrandItem(
          'Amanda’s Boutique',
          'A modern designer with a youthful spirit, dedicated to hand-making every piece with care....',
          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=200&auto=format&fit=crop',
        ),
        const SizedBox(height: 20),
        _buildBrandItem(
          'Nike',
          'Just Do It',
          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=200&auto=format&fit=crop',
        ),
        const SizedBox(height: 20),
        _buildBrandItem(
          'LOST COINS',
          '',
          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=200&auto=format&fit=crop',
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SfProText(
              context.lang.exploreTheGlobalScene,
              color: AppColor.blueColor,
              weight: 600,
              size: 14,
            ),
            const SizedBox(width: 4),
            const Icon(Icons.chevron_right, color: AppColor.blueColor, size: 16),
          ],
        ),
      ],
    );
  }

  Widget _buildBrandItem(String name, String description, String imageUrl) {
    return Row(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage(imageUrl),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SfProText(name, size: 18, weight: 700),
              if (description.isNotEmpty) ...[
                const SizedBox(height: 2),
                SfProText(
                  description,
                  size: 14,
                  weight: 400,
                  color: AppColor.fadeTextColor,
                  maxLines: 2,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
        SfProText(
          'More',
          color: AppColor.blueColor,
          weight: 600,
          size: 12,
        ),
      ],
    );
  }
}
