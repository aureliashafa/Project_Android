class DataBerita {
  final String status;
  final int totalResult;
  final List<DataArticles> articles;

  DataBerita({this.status, this.totalResult, this.articles});

  factory DataBerita.fromJson(Map<String, dynamic> json) {
    return DataBerita(
        status: json['status'],
        totalResult: json['totalResult'],
        articles: dataArticles(json));
  }
  static List<DataArticles> dataArticles(articles) {
    var list = articles['articles'] as List;
    List<DataArticles> listDataArticles =
        list.map((e) => DataArticles.fromJson(e)).toList();
    return listDataArticles;
  }
}

class DataArticles {
  final DataSource source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  DataArticles(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory DataArticles.fromJson(Map<String, dynamic> json) {
    return DataArticles(
      source: DataSource.fromJson(json['source']),
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}

class DataSource {
  final int id;
  final String name;

  DataSource({this.id, this.name});

  factory DataSource.fromJson(Map<String, dynamic> json) {
    return DataSource(
      id: json['id'],
      name: json['name'],
    );
  }
}
