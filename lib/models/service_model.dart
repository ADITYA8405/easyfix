/// Data model for a bookable service card
class ServiceModel {
  final String id;
  final String title;
  final String description;
  final String tag;
  final TagStyle tagStyle;
  final double price;
  final double originalPrice;
  final String imageUrl;

  const ServiceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.tag,
    required this.tagStyle,
    required this.price,
    required this.originalPrice,
    required this.imageUrl,
  });
}

enum TagStyle { mostBooked, urgent, popular, premium }

/// Dummy data for services
const List<ServiceModel> kServices = [
  ServiceModel(
    id: 's1',
    title: 'AC Repair',
    description:
        'Diagnosis & repair of all major AC issues. Covers gas leaks, PCB faults & compressor problems.',
    tag: 'Most Booked',
    tagStyle: TagStyle.mostBooked,
    price: 299,
    originalPrice: 499,
    imageUrl: 'https://cdn-icons-png.flaticon.com/512/4305/4305512.png',
  ),
  ServiceModel(
    id: 's2',
    title: 'AC Jet Wash Service',
    description:
        'Deep cleaning using high-pressure jets to remove dust, mold & allergens from your AC unit.',
    tag: 'Visit within 1 hour',
    tagStyle: TagStyle.urgent,
    price: 199,
    originalPrice: 349,
    imageUrl: 'https://cdn-icons-png.flaticon.com/512/3203/3203080.png',
  ),
  ServiceModel(
    id: 's3',
    title: 'Water Leakage Repair',
    description:
        'Fix drain blockages, clogged pipes & evaporator coil issues causing water dripping.',
    tag: 'Popular',
    tagStyle: TagStyle.popular,
    price: 249,
    originalPrice: 399,
    imageUrl: 'https://cdn-icons-png.flaticon.com/512/1062/1062069.png',
  ),
  ServiceModel(
    id: 's4',
    title: '1 Year Maintenance Plan',
    description:
        'Annual AMC covering 4 free services, priority support & unlimited minor repairs.',
    tag: 'Best Value',
    tagStyle: TagStyle.premium,
    price: 1499,
    originalPrice: 2499,
    imageUrl: 'https://cdn-icons-png.flaticon.com/512/9545/9545215.png',
  ),
];
