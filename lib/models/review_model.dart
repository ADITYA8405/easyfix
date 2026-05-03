/// Data model for a customer review
class ReviewModel {
  final String id;
  final String name;
  final String initials;
  final double rating;
  final String text;
  final String date;
  final String service;

  const ReviewModel({
    required this.id,
    required this.name,
    required this.initials,
    required this.rating,
    required this.text,
    required this.date,
    required this.service,
  });
}

/// Rating breakdown (stars 5 down to 1, percentage 0-1)
class RatingBreakdown {
  final int star;
  final double fraction;
  const RatingBreakdown({required this.star, required this.fraction});
}

const List<RatingBreakdown> kRatingBreakdown = [
  RatingBreakdown(star: 5, fraction: 0.78),
  RatingBreakdown(star: 4, fraction: 0.12),
  RatingBreakdown(star: 3, fraction: 0.05),
  RatingBreakdown(star: 2, fraction: 0.03),
  RatingBreakdown(star: 1, fraction: 0.02),
];

/// Dummy review data
const List<ReviewModel> kReviews = [
  ReviewModel(
    id: 'r1',
    name: 'Priya Rajan',
    initials: 'PR',
    rating: 5.0,
    text:
        'Technician arrived within 45 minutes. Very professional and fixed the gas leak quickly. AC is running perfectly now. Highly recommended!',
    date: '12 Apr 2025',
    service: 'AC Repair',
  ),
  ReviewModel(
    id: 'r2',
    name: 'Arun Kumar',
    initials: 'AK',
    rating: 5.0,
    text:
        'Excellent jet wash service! The technician was thorough and the AC is cooling so much better now. Great value for money.',
    date: '28 Mar 2025',
    service: 'AC Jet Wash',
  ),
  ReviewModel(
    id: 'r3',
    name: 'Meenakshi S',
    initials: 'MS',
    rating: 4.0,
    text:
        'Good service overall. The water leakage issue was resolved completely. Would have given 5 stars but had to wait an extra 30 mins.',
    date: '15 Mar 2025',
    service: 'Water Leakage Repair',
  ),
];
