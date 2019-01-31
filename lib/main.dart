import 'package:flutter/material.dart';
import 'list/list_page.dart';
import 'addnewlistitem/add_new_list_page.dart';
import 'listitem/list_item_page.dart';
import 'list/list_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ListProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        home: ListPage(),
        routes: <String, WidgetBuilder>{
          AddNewListPage.routeName: (context) => AddNewListPage(),
          ListItemPage.routeName: (contenxt) => ListItemPage(),
        },
      ),
    );
  }
}
