import 'package:app/models/beritamodels.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final List<DataArticles> articles;
  final int index;
  const Detail({this.articles, this.index});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFbeb3eb),
        title: Text(
          'Detail Berita',
          style: TextStyle(
            fontSize: 21.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 0, left: 0, right: 0),
              height: 120,
              child: Image.network(widget.articles[widget.index].urlToImage,
                  fit: BoxFit.fill),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 0),
              child: Text(
                widget.articles[widget.index].title,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Text(
                widget.articles[widget.index].author,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
              child: Text(
                widget.articles[widget.index].content,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
