import 'package:flutter/material.dart';
import 'package:flutter_lists/list/list_provider.dart';

import '../list/list_bloc.dart';

class AddNewListPage extends StatelessWidget {

  static const routeName = '/addnewlist';

  AddNewListPage();

  @override
  Widget build(BuildContext context) {
    final listBloc = ListProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New List'),
        leading: BackButton(),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            StreamBuilder(
              initialData: listBloc.getItem.toString(),
              stream: listBloc.getItem,
              builder: (context, snapshot) => TextField(
                onChanged: listBloc.setItem,
                decoration: InputDecoration(
                  hintText: 'String: ',
                  labelText: snapshot.data,
                  errorText: snapshot.error,
                )
              ),
            ),
            StreamBuilder(
              stream: listBloc.getItem,
              builder: (context, snapshot) => RaisedButton(
                child: Text('Click me'),
                onPressed: () {
                  listBloc.newListItem.add(NewListItem(snapshot.data));
                  Navigator.maybePop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}