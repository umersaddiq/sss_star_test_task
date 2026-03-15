import 'package:flutter/material.dart';
import '../../../widget/typography/sf_pro_text_widget.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return _buildProductItem(index);
      },
    );
  }

  Widget _buildProductItem(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?q=80&w=1000&auto=format&fit=crop&index=$index'),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withValues(alpha: 0.7),
            ],
          ),
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=100&auto=format&fit=crop'),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: SfProText(
                'Box Fit Minecraft Tee',
                size: 10,
                color: Colors.white,
                weight: 600,
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
              ),
            ),
            SfProText(
              'R4 999.99',
              size: 10,
              color: Colors.white,
              weight: 700,
            ),
          ],
        ),
      ),
    );
  }
}
