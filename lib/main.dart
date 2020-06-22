import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutterkamus/model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SearchListPage(),
    );
  }
}

class SearchListPage extends StatefulWidget {
  @override
  _SearchListPageState createState() => _SearchListPageState();
}

class _SearchListPageState extends State<SearchListPage> {
  var etSearce = new TextEditingController();
  bool isSearch = true;
  String query = "";
  List<Kamus> dataList = [];
  List<Kamus> filterList = [];

  var loading = false;

  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });
    dataList.clear();
    final response =
    await http.get("http://192.168.100.16/loginregister/translate.php");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          dataList.add(Kamus.fromJson(i));
          loading = false;
        }
      });
    }
  }

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    fetchData();
    dataList = new List<Kamus>();
    dataList = [];
  }

  _performSearch(String text) async {
    filterList.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    dataList.forEach((f) {
      if (f.english.contains(text) || f.id.toString().contains(text))
        filterList.add(f);
    });

    setState(() {});
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.blue,
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.search),
                  title: TextField(
                    controller: etSearce,
                    onChanged: _performSearch,
                    decoration: InputDecoration(
                        hintText: "Search", border: InputBorder.none),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      etSearce.clear();
                      _performSearch('');
                    },
                    icon: Icon(Icons.cancel),
                  ),
                ),
              ),
            ),
            loading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : Expanded(
              child: filterList.length != 0 || etSearce.text.isNotEmpty
                  ? ListView.builder(
                itemCount: filterList.length,
                itemBuilder: (context, i) {
                  final b = filterList[i];
                  return Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            b.english,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(b.indonesia),
                          Divider(),
                        ],
                      ));
                },
              )
                  : ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, i) {
                  final a = dataList[i];
                  return Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            a.english,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(a.indonesia),
                        ],
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
