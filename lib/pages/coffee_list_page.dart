import 'dart:convert';
import 'package:coffee_shop_app/fetch_data/coffee.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

class CoffeeListPage extends StatefulWidget {
  const CoffeeListPage({super.key});

  @override
  State<CoffeeListPage> createState() => _CoffeeListPageState();
}

class _CoffeeListPageState extends State<CoffeeListPage> {
  List<Coffee> list = [];

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  var url = Uri.https('raw.githubusercontent.com',
      '/rhromets/mock_json_data/main/coffee_fake_api.json');

  Future _fetchData() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          list = (json.decode(response.body) as List)
              .map((data) => Coffee.fromJson(data))
              .toList();
        });
      } else {
        throw Exception('Failed to load projects');
      }
    } catch (e) {
      throw Exception('General Error Exception');
    }
  }

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _refreshIndicatorKey.currentState?.show();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch data via http from json'),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _fetchData,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Image.network(list[index].imageUrl),
                    Text(list[index].name),
                    Text(list[index].cardSubtitle),
                    Text(list[index].price),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
