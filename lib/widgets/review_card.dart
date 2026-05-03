import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../models/review_model.dart';

/// Full reviews section: aggregate rating + individual cards
class ReviewsSection extends StatelessWidget {
  final List<ReviewModel> reviews;
  final List<RatingBreakdown> breakdown;
  final double averageRating;

  const ReviewsSection({
    super.key,
    required this.reviews,
    required this.breakdown,
    required this.averageRating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Aggregate rating panel
        _RatingAggregate(
          averageRating: averageRating,
          breakdown: breakdown,
          totalReviews: reviews.length,
        ),
        const SizedBox(height: 14),
        // Individual review cards
        ...reviews.map((r) => ReviewCard(review: r)),
      ],
    );
  }
}

/// Aggregate rating bar chart
class _RatingAggregate extends StatelessWidget {
  final double averageRating;
  final List<RatingBreakdown> breakdown;
  final int totalReviews;

  const _RatingAggregate({
    required this.averageRating,
    required this.breakdown,
    required this.totalReviews,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Big number
          Column(
            children: [
              Text(
                averageRating.toStringAsFixed(2),
                style: AppTextStyles.displayLarge.copyWith(
                  color: AppColors.primary,
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                ),
              ),
              _StarRow(rating: averageRating, size: 16),
              const SizedBox(height: 4),
              Text(
                '${totalReviews * 3280}+ reviews',
                style: AppTextStyles.bodySmall,
              ),
            ],
          ),
          const SizedBox(width: 20),
          // Bar breakdown
          Expanded(
            child: Column(
              children: breakdown
                  .map((b) => _RatingBar(breakdown: b))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _RatingBar extends StatelessWidget {
  final RatingBreakdown breakdown;
  const _RatingBar({required this.breakdown});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Text('${breakdown.star}', style: AppTextStyles.bodySmall),
          const SizedBox(width: 4),
          const Icon(Icons.star, size: 10, color: AppColors.star),
          const SizedBox(width: 6),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: breakdown.fraction,
                minHeight: 7,
                backgroundColor: AppColors.surface,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            '${(breakdown.fraction * 100).round()}%',
            style: AppTextStyles.bodySmall,
          ),
        ],
      ),
    );
  }
}

/// Individual review card
class ReviewCard extends StatelessWidget {
  final ReviewModel review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            children: [
              _Avatar(initials: review.initials),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(review.name, style: AppTextStyles.titleSmall),
                    Text(review.service, style: AppTextStyles.bodySmall),
                  ],
                ),
              ),
              // Rating badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star, size: 13, color: AppColors.primary),
                    const SizedBox(width: 3),
                    Text(
                      review.rating.toStringAsFixed(1),
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(review.text, style: AppTextStyles.bodyMedium),
          const SizedBox(height: 8),
          Text(review.date, style: AppTextStyles.labelSmall),
        ],
      ),
    );
  }
}

// ─── Sub-widgets ─────────────────────────────────────────────────────────────

class _Avatar extends StatelessWidget {
  final String initials;
  const _Avatar({required this.initials});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        gradient: AppColors.brandGradient,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _StarRow extends StatelessWidget {
  final double rating;
  final double size;

  const _StarRow({required this.rating, required this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (i) {
        if (i < rating.floor()) {
          return Icon(Icons.star, size: size, color: AppColors.star);
        } else if (i < rating) {
          return Icon(Icons.star_half, size: size, color: AppColors.star);
        }
        return Icon(Icons.star_border, size: size, color: AppColors.star);
      }),
    );
  }
}
