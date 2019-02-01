import 'package:flutter/material.dart';
import 'list_provider.dart';
import '../common/models/simplelist.dart';

class ListPage extends StatelessWidget {

  static const routeName = '/list';

  @override
  Widget build(BuildContext context) {
    final listBloc = ListProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Lists'),
      ),
      body: StreamBuilder<List<String>>(
        initialData: SimpleList().simpleList, // TODO: For the moment this initiates to an empty array. Later on will get data from db
        stream: listBloc.getItemList,
        builder: (context, snapshot) => ListView(
          children: snapshot.data.map((item) => 
            ListTile(
              title: Text(item),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.of(context).pushNamed('/listitem'),
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
