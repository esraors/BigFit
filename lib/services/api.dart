import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ApiEx extends StatefulWidget {
  @override
  _ApiExState createState() => new _ApiExState();
}

class _ApiExState extends State<ApiEx> {
  StreamController _postsController;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  int count = 1;

  Future fetchPost([howMany = 5]) async {
    final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('yükleme hatası');
    }
  }

  loadPosts() async {
    fetchPost().then((res) async {
      _postsController.add(res);
      return res;
    });
  }

  showSnack() {
    return scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text('yenilendi'),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    count++;
    print(count);
    fetchPost(count * 5).then((res) async {
      _postsController.add(res);
      showSnack();
      return null;
    });
  }

  @override
  void initState() {
    _postsController = new StreamController();
    loadPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text('StreamBuilder'),
        actions: <Widget>[
          IconButton(
            tooltip: 'Refresh',
            icon: Icon(Icons.refresh),
            onPressed: _handleRefresh,
          )
        ],
      ),
      body: StreamBuilder(
        stream: _postsController.stream,
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print('Has error: ${snapshot.hasError}');
          print('Has data: ${snapshot.hasData}');
          print('Snapshot Data ${snapshot.data}');

          if (snapshot.hasError) {
            return Text(snapshot.error);
          }

          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: Scrollbar(
                    child: RefreshIndicator(
                      onRefresh: _handleRefresh,
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          var post = snapshot.data[index];
                          return ListTile(
                            title: Text(post['title']['rendered']),
                            subtitle: Text(post['date']),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Text('No Posts');
          }
        },
      ),
    );
  }
}
