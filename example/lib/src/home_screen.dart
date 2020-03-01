import 'package:flutter/material.dart';
import 'package:listutils/listutils.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example'),
      ),
      body: CustomListView(
        loadingBuilder: CustomListLoading.defaultBuilder,
        header: Container(
          height: 50,
          child: Center(
            child: Text('Header'),
          ),
        ),
        footer: Container(
          height: 50,
          child: Center(
            child: Text('Footer'),
          ),
        ),
        adapter: const NetworkListAdapter(
          url: 'https://jsonplaceholder.typicode.com/posts',
          limitParam: '_limit',
          offsetParam: '_start',
        ),
        separatorBuilder: (context, _) {
          return Divider(height: 1);
        },
        itemBuilder: (context, _, item) {
          return ListTile(
            title: Text(item['title']),
            leading: Icon(Icons.assignment),
          );
        },
      ),
    );
  }
}
