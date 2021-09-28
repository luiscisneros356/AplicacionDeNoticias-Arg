import 'package:flutter/material.dart';
import 'package:noticias_app/api/api_noticias.dart';
import 'package:noticias_app/models/noticia_model.dart';

import 'package:url_launcher/url_launcher.dart';

class General extends StatefulWidget {
  @override
  _GeneralState createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getNews("business"),
        builder:
            (BuildContext context, AsyncSnapshot<List<Articulo>> snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return Container(
            height: double.infinity,
            width: double.infinity,
            child: ListView.builder(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          noticia.title!,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: FadeInImage(
                              placeholder: AssetImage("assets/giphy.gif"),
                              image: NetworkImage(noticia.urlToImage!)),
                        ),
                        SizedBox(height: 10),
                        Text(
                          noticia.description!,
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            launch(noticia.url!);
                          },
                          child: Text("Ir a la noticia"),
                        ),
                        Divider(color: Colors.white),
                        SizedBox(height: 10),
                      ],
                    ),
                  );

                return CircularProgressIndicator();
              },
            ),
          );
        },
      ),
    );
  }
}
