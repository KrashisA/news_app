import 'package:flutter/material.dart';
import 'package:newz/data/local/fav_article.dart';
import 'package:newz/data/remote/news_api_service.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'News Articles',
          style: TextStyle(
            color: Colors.black,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  //get the data from the api and store it and show it
                  future: getApi(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.articles!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                //card ui
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Stack(children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    height: MediaQuery.of(context).size.height *
                                        0.45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
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
                                            image: NetworkImage(snapshot.data!
                                                .articles![index].urlToImage
                                                .toString())),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              4, 8, 4, 4),
                                          child: Text(
                                            snapshot
                                                .data!.articles![index].title
                                                .toString(),
                                            style: TextStyle(
                                                overflow: TextOverflow.clip,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
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
                                          favArticle.contains(index)
                                              ? Icons.favorite
                                              : Icons.favorite_outline,
                                          size: 36,
                                        ),
                                        onPressed: () {
                                          favArticle.add(index);
                                          setState(() {});
                                        },
                                      )),
                                ]));
                          });
                    }
                  }))
        ],
      ),
    );
  }
}
