import 'package:flutter/material.dart';
import '../blocs/add_new_list_bloc_provider.dart';

import './list_screen.dart';

class AddNewListScreen extends StatefulWidget {
  AddNewListScreen();

  @override
  AddNewListScreenState createState() {
    return AddNewListScreenState();
  }
}

class AddNewListScreenState extends State<AddNewListScreen> {
  AddNewListBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = AddNewListProvider.of(context);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Lists Bloc with Firebase'),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            StreamBuilder(
              stream: _bloc.listNameObservable,
              builder: (context, snapshot) => TextField(
                onChanged: (String value) => _bloc.changeListName(value),
                decoration: InputDecoration(
                  labelText: 'New List Item: ',
                ),
              ),
            ),
            RaisedButton(
              child: Text('SUBMIT'),
              onPressed: () {
                _bloc.addNewList();
                return Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListScreen()
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
