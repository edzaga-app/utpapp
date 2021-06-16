import '../widgets/news/news_widgets.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
         child: Text('Noticias'),
      ),
    );
  }
}