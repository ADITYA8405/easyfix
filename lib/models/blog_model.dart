/// Data model for blog/tip cards
class BlogModel {
  final String id;
  final String title;
  final String readTime;
  final String imageUrl;
  final String category;

  const BlogModel({
    required this.id,
    required this.title,
    required this.readTime,
    required this.imageUrl,
    required this.category,
  });
}

/// Dummy blog data
const List<BlogModel> kBlogs = [
  BlogModel(
    id: 'b1',
    title: 'Why Your AC Stops Cooling in Summer',
    readTime: '4 min read',
    imageUrl: 'https://picsum.photos/seed/ac1/200/120',
    category: 'Maintenance',
  ),
  BlogModel(
    id: 'b2',
    title: 'How Often Should You Service Your AC?',
    readTime: '3 min read',
    imageUrl: 'https://picsum.photos/seed/ac2/200/120',
    category: 'Tips',
  ),
  BlogModel(
    id: 'b3',
    title: 'Signs Your AC Needs Immediate Repair',
    readTime: '5 min read',
    imageUrl: 'https://picsum.photos/seed/ac3/200/120',
    category: 'Guide',
  ),
];
