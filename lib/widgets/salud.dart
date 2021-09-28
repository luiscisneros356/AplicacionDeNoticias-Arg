import 'package:flutter/material.dart';
import 'package:noticias_app/api/api_noticias.dart';
import 'package:noticias_app/models/noticia_model.dart';

import 'package:url_launcher/url_launcher.dart';

class Salud extends StatefulWidget {
  @override
  _SaludState createState() => _SaludState();
}

class _SaludState extends State<Salud> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getNews("health"),
        builder:
            (BuildContext context, AsyncSnapshot<List<Articulo>> snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, i) {
              var noticia = snapshot.data![i];
              if (noticia.title != null &&
                  noticia.urlToImage != null &&
                  noticia.description != null &&
                  noticia.url != null)
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Stack(
                    children: [
                      SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FadeInImage(
                            placeholder: AssetImage("assets/giphy.gif"),
                            image: NetworkImage(noticia.urlToImage!)),
                      ),
                      SizedBox(height: 10),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 370,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.6)),
                          child: Text(
                            noticia.title!,
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: ElevatedButton(
                          onPressed: () {
                            launch(noticia.url!);
                          },
                          child: Text("Ver mas"),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                );

              return Text("");
            },
          );
        },
      ),
    );
  }
}
