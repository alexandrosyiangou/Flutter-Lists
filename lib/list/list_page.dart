import 'package:flutter/material.dart';
import 'list_provider.dart';
import 'simplelist.dart';

class ListPage extends StatelessWidget {

  static const routeName = '/list';

  @override
  Widget build(BuildContext context) {
    final listBloc = ListProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello world!'),
      ),
      body: StreamBuilder<List<String>>(
        initialData: SimpleList().simpleList,
        stream: listBloc.item,
        builder: (context, snapshot) => ListView(
          children: snapshot.data.map((item) => 
            ListTile(
              title: Text(item),
              trailing: Icon(Icons.arrow_forward_ios),
            )
          ).toList()
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Test',
        onPressed: () => Navigator.of(context).pushNamed('/addnewlist'),
      ),
    );
  }
}
