import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName;

  const CategoryTile({
    super.key,
    required this.imageUrl,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Stack(
        children: <Widget>[
          Image.network(  
            imageUrl, 
            width: 120, 
            height: 60, 
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}