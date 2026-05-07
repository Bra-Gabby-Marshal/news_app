import 'package:flutter/material.dart';
import 'package:news_app/components/blog_tile.dart';
import 'package:news_app/components/category_tile.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      categories = getCategories();
      getNews();
  }

  getNews() async {
    NewsService newsService = NewsService();
    await newsService.getNews();
    articles = newsService.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Flutter"),
          Text("News", style: TextStyle(color: Colors.blue),)
        ],
      ),
      centerTitle: true,
      elevation: 0.0,
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),)) : SingleChildScrollView(
            child: Container(
                    child: Column(
            children: <Widget>[
              // Categories
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                height: 70,
                child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      imageUrl: categories[index].imageUrl,
                      categoryName: categories[index].categoryName
                    );
                  }),
              ),
            
            // Blogs / News
            Expanded(
              child: ListView.builder(
                itemCount: articles.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return BlogTile(
                    imageUrl: articles[index].urlToImage,
                    title: articles[index].title,
                    desc: articles[index].description,
                    url: articles[index].articleUrl,
                  );
                },
              ),
            )
            ],
                    ),
                  ),
          )
    );
  }
}