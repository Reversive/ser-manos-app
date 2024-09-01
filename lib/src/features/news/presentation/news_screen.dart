import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  static const String route = '/news';
  static const String routeName = 'news';
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
