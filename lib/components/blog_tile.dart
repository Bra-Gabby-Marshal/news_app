import 'package:flutter/material.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;
  const BlogTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(
            imageUrl,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 200,
              color: Colors.grey[300],
              alignment: Alignment.center,
              child: const Icon(Icons.broken_image, size: 48, color: Colors.grey),
            ),
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return SizedBox(
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(
                    value: progress.expectedTotalBytes != null
                        ? progress.cumulativeBytesLoaded /
                            progress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
          ),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(desc),
        ],
      ),
    );
  }
}