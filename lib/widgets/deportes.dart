import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:noticias_app/api/api_noticias.dart';
import 'package:noticias_app/models/noticia_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Deportes extends StatefulWidget {
  @override
  _DeportesState createState() => _DeportesState();
}

class _DeportesState extends State<Deportes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getNews("sports"),
        builder:
            (BuildContext context, AsyncSnapshot<List<Articulo>> snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int i) {
              var noticia = snapshot.data![i];
              if (noticia.title != null &&
                  noticia.urlToImage != null &&
                  noticia.description != null &&
                  noticia.url != null)
                return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(noticia.urlToImage!),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              launch(noticia.url!);
                            },
                            child: Icon(Icons.arrow_forward)),
                        Container(
                            height: 70,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.9)),
                            child: Text(
                              noticia.title!,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            )),
                      ],
                    ));
              return Text("");
            },
            staggeredTileBuilder: (int index) =>
                new StaggeredTile.count(2, index.isEven ? 3 : 4),
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          );

/*
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
                    noticia.url != null) {
                  return Column(
                    children: [
                      Divider(
                        color: Colors.white,
                        thickness: 1.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child:
                            /* Column(
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
                              child: Text("Ver mas"),
                            ),
                            SizedBox(height: 30),
                          ],
                        ), */
                            Card(
                          elevation: 10,
                          child: ListTile(
                            shape: Border.all(color: Colors.white, width: 4),
                            title: Text(noticia.title!,
                                style: TextStyle(fontSize: 20)),
                            subtitle: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: FadeInImage(
                                  placeholder: AssetImage("assets/giphy.gif"),
                                  image: NetworkImage(noticia.urlToImage!)),
                            ),
                            trailing: ElevatedButton(
                              onPressed: () {
                                launch(noticia.url!);
                              },
                              child: Text("Ver"),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                } */
        },
      ),
    );
  }
}
