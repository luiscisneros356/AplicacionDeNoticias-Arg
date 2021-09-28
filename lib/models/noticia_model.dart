import 'dart:convert';

class RespuestaModelo {
  RespuestaModelo({
    required this.status,
    required this.totalResults,
    this.articles,
  });

  String status;
  int totalResults;
  List<Articulo>? articles;

  factory RespuestaModelo.fromJson(String str) =>
      RespuestaModelo.fromMap(json.decode(str));

  factory RespuestaModelo.fromMap(Map<String, dynamic> json) => RespuestaModelo(
        status: json["status"] == null ? null : json["status"],
        totalResults:
            json["totalResults"] == null ? null : json["totalResults"],
        articles: json["articles"] == null
            ? null
            : List<Articulo>.from(
                json["articles"].map((x) => Articulo.fromMap(x))),
      );
}

class Articulo {
  Articulo({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  factory Articulo.fromJson(String str) => Articulo.fromMap(json.decode(str));

  factory Articulo.fromMap(Map<String, dynamic> json) => Articulo(
        author: json["author"] == null ? null : json["author"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        url: json["url"] == null ? null : json["url"],
        urlToImage: json["urlToImage"] == null ? null : json["urlToImage"],
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        content: json["content"] == null ? null : json["content"],
      );
}
