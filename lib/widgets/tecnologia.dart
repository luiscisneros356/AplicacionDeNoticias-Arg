import 'package:flutter/material.dart';
import 'package:noticias_app/api/api_noticias.dart';
import 'package:noticias_app/models/noticia_model.dart';

import 'package:url_launcher/url_launcher.dart';

class Tecnologia extends StatefulWidget {
  @override
  _TecnologiaState createState() => _TecnologiaState();
}

class _TecnologiaState extends State<Tecnologia> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getNews("technology"),
        builder:
            (BuildContext context, AsyncSnapshot<List<Articulo>> snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return Container(
            height: double.infinity,
            width: double.infinity,
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.89),
              itemCount: snapshot.data!.length,
              itemBuilder: (_, i) {
                var noticia = snapshot.data![i];
                if (noticia.title != null &&
                    noticia.urlToImage != null &&
                    noticia.description != null &&
                    noticia.url != null)
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          noticia.title!,
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: FadeInImage(
                              placeholder: AssetImage("assets/giphy.gif"),
                              image: NetworkImage(noticia.urlToImage!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          noticia.description!,
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            launch(noticia.url!);
                          },
                          child: Text("Ver mas"),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  );

                return Text("");
              },
            ),
          );
        },
      ),
    );
  }
}
