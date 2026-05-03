import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../models/service_model.dart';

/// Reusable card for a single bookable service
class ServiceCard extends StatefulWidget {
  final ServiceModel service;

  const ServiceCard({super.key, required this.service});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _added = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left: Content
            Expanded(child: _buildContent()),
            const SizedBox(width: 12),
            // Right: Image + CTA
            _buildImageAndCTA(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TagChip(tag: widget.service.tag, style: widget.service.tagStyle),
        const SizedBox(height: 6),
        Text(widget.service.title, style: AppTextStyles.titleMedium),
        const SizedBox(height: 4),
        Text(
          widget.service.description,
          style: AppTextStyles.bodyMedium,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 10),
        _PriceRow(
          price: widget.service.price,
          originalPrice: widget.service.originalPrice,
        ),
      ],
    );
  }

  Widget _buildImageAndCTA() {
    return Column(
      children: [
        // Service image
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            widget.service.imageUrl,
            width: 90,
            height: 80,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => _PlaceholderImage(size: 90),
          ),
        ),
        const SizedBox(height: 10),
        // Add / Added button
        _AddButton(
          added: _added,
          onTap: () => setState(() => _added = !_added),
        ),
      ],
    );
  }
}

// ─── Sub-widgets ─────────────────────────────────────────────────────────────

class _TagChip extends StatelessWidget {
  final String tag;
  final TagStyle style;

  const _TagChip({required this.tag, required this.style});

  Color get _bg {
    switch (style) {
      case TagStyle.mostBooked:
        return AppColors.primaryLight;
      case TagStyle.urgent:
        return const Color(0xFFFFEDD5);
      case TagStyle.popular:
        return const Color(0xFFDCFCE7);
      case TagStyle.premium:
        return const Color(0xFFFDF4FF);
    }
  }

  Color get _fg {
    switch (style) {
      case TagStyle.mostBooked:
        return AppColors.primary;
      case TagStyle.urgent:
        return const Color(0xFFEA580C);
      case TagStyle.popular:
        return const Color(0xFF16A34A);
      case TagStyle.premium:
        return const Color(0xFF9333EA);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: _bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        tag,
        style: AppTextStyles.labelSmall.copyWith(
          color: _fg,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final double price;
  final double originalPrice;

  const _PriceRow({required this.price, required this.originalPrice});

  @override
  Widget build(BuildContext context) {
    final discount =
        (((originalPrice - price) / originalPrice) * 100).round();
    return Row(
      children: [
        Text('₹${price.toInt()}', style: AppTextStyles.priceMain),
        const SizedBox(width: 6),
        Text('₹${originalPrice.toInt()}', style: AppTextStyles.priceStrike),
        const SizedBox(width: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          decoration: BoxDecoration(
            color: const Color(0xFFDCFCE7),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            '$discount% OFF',
            style: AppTextStyles.labelSmall.copyWith(
              color: const Color(0xFF16A34A),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class _AddButton extends StatelessWidget {
  final bool added;
  final VoidCallback onTap;

  const _AddButton({required this.added, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        gradient: added ? AppColors.brandGradient : null,
        border: added ? null : Border.all(color: AppColors.primary, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 7),
          child: Text(
            added ? '✓ Added' : 'Add',
            style: AppTextStyles.labelLarge.copyWith(
              color: added ? Colors.white : AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}

class _PlaceholderImage extends StatelessWidget {
  final double size;
  const _PlaceholderImage({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size * 0.88,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(Icons.ac_unit_rounded, color: AppColors.primary, size: 34),
    );
  }
}
