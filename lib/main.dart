import 'package:flutter/material.dart';

import './addnewlistitem/add_new_list_page.dart';
// import 'package:flutter_lists/login/login_page.dart';
import './list/list_page.dart';
import './list/list_provider.dart';
import './listitem/list_item_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        home: ListPage(),
        routes: <String, WidgetBuilder>{
          AddNewListPage.routeName: (context) => AddNewListPage(), // /addnewlist
          ListItemPage.routeName: (contenxt) => ListItemPage(),    // /listitem
        },
      ),
    );
  }
}
