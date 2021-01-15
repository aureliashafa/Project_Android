import 'package:app/detail.dart';
import 'package:app/notifier/databeritanotifier.dart';
import 'package:app/notifier/datacovidnotifier.dart';
import 'package:app/provider.dart';
import 'package:app/util/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(microseconds: 20), () {
      context.read(dataCovidNotifierProvider).fetchDataCovid();
      context.read(dataBeritaNotifierProvider).fetchDataBerita();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFbeb3eb),
        title: Text(
          "Halaman Utama",
          style: TextStyle(
            fontSize: 21.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ProviderListener(
          onChange: (context, provider) {
            if (provider is DataCovidError) {
              return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(provider.message),
                    );
                  });
            }
          },
          provider: dataCovidNotifierProvider,
          child: Consumer(
            builder: (context, watch, child) {
              final state = watch(dataCovidNotifierProvider.state);
              final stateBerita = watch(dataBeritaNotifierProvider.state);
              if (state is DataCovidLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is DataCovidLoaded) {
                return Container(
                  padding: const EdgeInsets.only(
                      top: 30, bottom: 0, left: 20, right: 20),
                  child: Column(
                    children: [
                      Text(
                        "Data Kasus COVID-19 di Indonesia",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 20, right: 20),
                              decoration: BoxDecoration(
                                color: Color(0xFFfbf7f5),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.5),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Positif",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    '${state.dataCovid.positif}',
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 40, right: 40),
                              decoration: BoxDecoration(
                                color: Color(0xFF00ffff),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15.5)),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Dirawat",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    '${state.dataCovid.dirawat}',
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 40, right: 40),
                              decoration: BoxDecoration(
                                color: Color(0xFF00ff00),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15.5)),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Sembuh",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    '${state.dataCovid.sembuh}',
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 30, right: 30),
                              decoration: BoxDecoration(
                                color: Color(0xFFff0000),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(15.5)),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Meninggal",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    '${state.dataCovid.meninggal}',
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Berita Terkini",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      stateBerita is DataBeritaLoading
                          ? Container()
                          : stateBerita is DataBeritaLoaded
                              ? Container(
                                  height: 500,
                                  child: ListView.builder(
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            pushNav(
                                                context,
                                                Detail(
                                                  articles: stateBerita
                                                      .dataBerita.articles,
                                                  index: index,
                                                ));
                                          },
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                      child: Image.network(
                                                    '${stateBerita.dataBerita.articles[index].urlToImage}',
                                                    fit: BoxFit.fill,
                                                    width: 120,
                                                    height: 120,
                                                  )),
                                                ),
                                                Expanded(
                                                    child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 0,
                                                    bottom: 0,
                                                    left: 10,
                                                    right: 10,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${stateBerita.dataBerita.articles[index].title}',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      Text(
                                                        '${stateBerita.dataBerita.articles[index].author}',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      Text(
                                                        '${stateBerita.dataBerita.articles[index].description}',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 3,
                                                      )
                                                    ],
                                                  ),
                                                )),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              : Container()
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
