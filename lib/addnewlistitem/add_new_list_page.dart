import 'package:flutter/material.dart';
import 'package:flutter_lists/list/list_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddNewListPage extends StatelessWidget {

  static const routeName = '/addnewlist';
  final listsCollection = Firestore.instance.collection('Lists');
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
                onPressed: () => Firestore.instance.runTransaction((Transaction tx) async {
                    Record record = Record(name: snapshot.data, votes: 0);
                    await listsCollection.add(record.toJson());
                    Navigator.maybePop(context);
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Record {
  final String name;
  final int votes;

  Record({
    this.name, 
    this.votes,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'votes': votes,
  };

  @override
  String toString() => "Record<$name:$votes>";
}
