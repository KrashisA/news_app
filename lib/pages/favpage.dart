import 'package:flutter/material.dart';
import 'package:newz/data/local/fav_article.dart';
import 'package:newz/data/remote/news_api_service.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Favourites',
          style: TextStyle(
            color: Colors.black,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: FutureBuilder(
                  future: getApi(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.articles!.length,
                          itemBuilder: (context, index) {
                            return favArticle.contains(index)
                                ? Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    child: Stack(children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(12),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.95,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.45,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.grey.shade200,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image(
                                                height: 180,
                                                image: NetworkImage(snapshot
                                                    .data!
                                                    .articles![index]
                                                    .urlToImage
                                                    .toString())),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      4, 8, 4, 4),
                                              child: Text(
                                                snapshot.data!.articles![index]
                                                    .title
                                                    .toString(),
                                                style: TextStyle(
                                                    overflow: TextOverflow.clip,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      4, 4, 4, 4),
                                              child: Text(
                                                snapshot.data!.articles![index]
                                                    .description
                                                    .toString(),
                                                maxLines: 4,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 15,
                                          right:
                                              15, //give the values according to your requirement
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.delete,
                                              size: 36,
                                            ),
                                            onPressed: () {
                                              favArticle.remove(index);
                                              setState(() {});
                                            },
                                          )),
                                    ]))
                                : Container();
                          });
                    }
                  }))
        ],
      ),
    );
  }
}
