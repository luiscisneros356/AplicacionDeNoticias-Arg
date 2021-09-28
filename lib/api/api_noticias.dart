import 'package:http/http.dart' as http;

import 'package:noticias_app/models/noticia_model.dart';

Future<List<Articulo>> getNews(String categoriaSeleccionada) async {
  String _apiKey = "37c577ac3d10486e823030dded1bcac9";
  String _baseUrl = "newsapi.org";

  var url = Uri.https(_baseUrl, "/v2/top-headlines",
      {"country": "ar", "apiKey": _apiKey, "category": categoriaSeleccionada});
  final resp = await http.get(url);
  final news = RespuestaModelo.fromJson(resp.body);
  return news.articles!;
}
