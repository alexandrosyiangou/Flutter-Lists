import 'package:flutter/material.dart';
import 'list_provider.dart';
import '../common/models/simplelist.dart';
import '../listitem/list_item_page.dart';

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
        builder: (context, snapshot) => ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(snapshot.data[index]),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => 
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListItemPage(item: snapshot.data[index])
              ),
            ),
          ),
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
