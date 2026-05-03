import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';
import '../constants/text_styles.dart';
import '../models/blog_model.dart';
import '../models/error_code_model.dart';
import '../models/review_model.dart';
import '../models/service_model.dart';
import '../widgets/blog_card.dart';
import '../widgets/bottom_cta.dart';
import '../widgets/error_code_card.dart';
import '../widgets/review_card.dart';
import '../widgets/section_header.dart';
import '../widgets/service_card.dart';

/// EasyFix – Home Appliance Service Booking Screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          // Main scrollable content
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: _HeroSection()),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),

              // ── Services ─────────────────────────────────────────
              const SliverToBoxAdapter(
                child: SectionHeader(
                  title: AppStrings.servicesHeader,
                  actionLabel: 'See All',
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, i) => ServiceCard(service: kServices[i]),
                  childCount: kServices.length,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),

              // ── Reviews ──────────────────────────────────────────
              const SliverToBoxAdapter(
                child: SectionHeader(
                  title: AppStrings.reviewsHeader,
                  actionLabel: 'All Reviews',
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverToBoxAdapter(
                child: ReviewsSection(
                  reviews: kReviews,
                  breakdown: kRatingBreakdown,
                  averageRating: 4.83,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),

              // ── Service Coverage ──────────────────────────────────
              const SliverToBoxAdapter(
                child: SectionHeader(title: AppStrings.coverageHeader),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              const SliverToBoxAdapter(child: _CoverageSection()),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),

              // ── Error Codes ───────────────────────────────────────
              const SliverToBoxAdapter(
                child: SectionHeader(title: AppStrings.errorCodesHeader),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                     maxCrossAxisExtent: 220,
  mainAxisSpacing: 12,
  crossAxisSpacing: 12,
  childAspectRatio: 1.2,
                      ),
                  delegate: SliverChildBuilderDelegate(
                    (_, i) => ErrorCodeCard(errorCode: kErrorCodes[i]),
                    childCount: kErrorCodes.length,
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),

              // ── Blog ─────────────────────────────────────────────
              const SliverToBoxAdapter(
                child: SectionHeader(
                  title: AppStrings.blogHeader,
                  actionLabel: 'View All',
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverToBoxAdapter(child: _BlogSection(blogs: kBlogs)),

              // Bottom padding for sticky bar
              const SliverToBoxAdapter(child: SizedBox(height: 90)),
            ],
          ),

          // Sticky Bottom CTA
          const Positioned(left: 0, right: 0, bottom: 0, child: BottomCTA()),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.card,
      elevation: 0,
      shadowColor: Colors.black.withOpacity(0.08),
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 18,
          color: AppColors.textPrimary,
        ),
        onPressed: () {},
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Logo circle
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              gradient: AppColors.brandGradient,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.ac_unit_rounded,
              color: Colors.white,
              size: 16,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            AppStrings.appName,
            style: AppTextStyles.titleMedium.copyWith(
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                ).createShader(const Rect.fromLTWH(0, 0, 160, 20)),
            ),
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        // Call icon
        _AppBarIconBtn(
          icon: Icons.phone_rounded,
          onTap: () {},
        ),
        // WhatsApp icon
        _AppBarIconBtn(
          icon: Icons.chat_rounded,
          color: const Color(0xFF25D366),
          onTap: () {},
        ),
        // Book Now pill
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              gradient: AppColors.brandGradient,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Book',
              style: AppTextStyles.labelLarge.copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

// ─── App Bar Icon Button ──────────────────────────────────────────────────────

class _AppBarIconBtn extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final VoidCallback onTap;

  const _AppBarIconBtn({
    required this.icon,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 4),
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: (color ?? AppColors.primary).withOpacity(0.10),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 18,
          color: color ?? AppColors.primary,
        ),
      ),
    );
  }
}

// ─── Hero Section ─────────────────────────────────────────────────────────────

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
        gradient: AppColors.heroGradient,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          // AC illustration
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Image.network(
              'https://cdn-icons-png.flaticon.com/512/9545/9545215.png',
              height: 140,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => const _HeroPlaceholder(),
            ),
          ),
          // Text content
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 12, 18, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.heroTitle, style: AppTextStyles.displayMedium),
                const SizedBox(height: 10),
                // Rating row
                Row(
                  children: [
                    const Icon(Icons.star, color: AppColors.star, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      AppStrings.heroRating,
                      style: AppTextStyles.labelLarge,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: AppColors.textHint,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      AppStrings.heroBookings,
                      style: AppTextStyles.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Badges row
                Row(
                  children: [
                    _BadgeChip(
                      icon: Icons.verified_rounded,
                      label: AppStrings.warrantyBadge,
                      color: AppColors.success,
                    ),
                    const SizedBox(width: 8),
                    _BadgeChip(
                      icon: Icons.local_offer_rounded,
                      label: AppStrings.lowestPriceGuarantee,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroPlaceholder extends StatelessWidget {
  const _HeroPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Icon(Icons.ac_unit_rounded, size: 60, color: AppColors.primary),
      ),
    );
  }
}

class _BadgeChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _BadgeChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 14),
          const SizedBox(width: 5),
          Text(
            label,
            style: AppTextStyles.labelSmall.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Coverage Section ─────────────────────────────────────────────────────────

class _CoverageSection extends StatelessWidget {
  const _CoverageSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            // Map thumbnail
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(
                'https://maps.googleapis.com/maps/api/staticmap?center=Chennai,India&zoom=11&size=600x200&maptype=roadmap&key=AIzaSyDUMMY',
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 140,
                  color: AppColors.primaryLight,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.map_rounded,
                          color: AppColors.primary,
                          size: 40,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Chennai Service Area',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Text content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.coverageDesc, style: AppTextStyles.bodyMedium),
                  const SizedBox(height: 12),
                  ...AppStrings.coverageBullets.map(
                    (b) => _BulletPoint(text: b),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BulletPoint extends StatelessWidget {
  final String text;
  const _BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: AppColors.primaryLight,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_rounded,
              size: 13,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 10),
          Text(text, style: AppTextStyles.bodyMedium),
        ],
      ),
    );
  }
}

//  Blog Section

class _BlogSection extends StatelessWidget {
  final List<BlogModel> blogs;
  const _BlogSection({required this.blogs});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16, right: 4),
        itemCount: blogs.length,
        itemBuilder: (_, i) => BlogCard(blog: blogs[i]),
      ),
    );
  }
}
