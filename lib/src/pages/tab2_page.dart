import 'package:app_flutter_news/src/models/category_model.dart';
import 'package:app_flutter_news/src/services/news_service.dart';
import 'package:app_flutter_news/src/theme/theme.dart';
import 'package:app_flutter_news/src/widgets/list_news.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            _ListCategories(),
            if(!newsService.isLoading)
              Expanded(
                child: ListNews(newsService.getArticlesCategorySelected),
              ),
            
            if(newsService.isLoading)
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class _ListCategories extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final categories=Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index){
          final cName = categories[index].name;
          return Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                _CategoryButton(categories[index]),
                SizedBox(height: 5,),
                Text('${cName[0].toUpperCase()}${cName.substring(1)}')
              ],
            ),
          );        
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  
  final Category category;

  const _CategoryButton(this.category);

  @override
  Widget build(BuildContext context) {
    
    final newsService = Provider.of<NewsService>(context);
    
    return GestureDetector(
      onTap: (){
        //print('${category.name}');        
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          category.icon,
          color: (category.name==newsService.selectedCategory)?myTheme.accentColor: Colors.black54,
        ),
      ),
    );
  }
}

