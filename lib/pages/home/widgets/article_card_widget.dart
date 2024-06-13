import 'package:flutter/material.dart';

class Article {
  final String title;
  final String description;
  final String imageUrl;

  Article({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

List<Article> mockArticles = [
  Article(
    title: "Article 1",
    description: "Description for Article 1",
    imageUrl: "https://via.placeholder.com/150",
  ),
  Article(
    title: "Article 2",
    description: "Description for Article 2",
    imageUrl: "https://via.placeholder.com/150",
  ),
];

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({required this.article, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              article.imageUrl,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors
                          .black, // Ensure text color is black for contrast
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    article.description,
                    style: const TextStyle(
                      color: Colors
                          .black, // Ensure text color is black for contrast
                    ),
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

class ArticleListView extends StatelessWidget {
  const ArticleListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: mockArticles.length,
      itemBuilder: (context, index) {
        return ArticleCard(article: mockArticles[index]);
      },
    );
  }
}
