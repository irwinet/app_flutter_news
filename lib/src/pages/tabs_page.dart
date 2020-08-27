import 'package:app_flutter_news/src/pages/tab1_page.dart';
import 'package:app_flutter_news/src/pages/tab2_page.dart';
import 'package:app_flutter_news/src/services/news_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>new _NavigationModel(),
      child: Scaffold(
        body: _Pages(),          
        bottomNavigationBar: _Navigation(),  
      ),
    );
  }
}

class _Navigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);
    // final newsService = Provider.of<NewsService>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.pageCurrent,
      onTap: (i)=>navigationModel.pageCurrent = i,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), title: Text('For you')),
        BottomNavigationBarItem(icon: Icon(Icons.public), title: Text('Headers')),
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      //physics: BouncingScrollPhysics(),
      controller: navigationModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Tab1Page(),
        Tab2Page(),
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier{
  int _pageCurrent = 0;
  PageController _pageController = new PageController();

  int get pageCurrent => this._pageCurrent;
  
  set pageCurrent(int value){
    this._pageCurrent=value;
    _pageController.animateToPage(value, duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}