import 'package:flutter/material.dart';
import 'list_provider.dart';
import '../common/models/simplelist.dart';
import '../listitem/list_item_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListPage extends StatelessWidget {

  static const routeName = '/list';

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Lists with Firebase'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('Lists').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          
          return ListView(
            padding: const EdgeInsets.only(top: 20.0),
            children: snapshot.data.documents.map((data) {
              final record = Record.fromSnapshot(data);

              return Padding(
                key: ValueKey(record.name),
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: ListTile(
                    title: Text(record.name),
                    trailing: Text(record.votes.toString()),
                     onTap: () => Firestore.instance.runTransaction((transaction) async {
                        final freshSnapshot = await transaction.get(record.reference);
                        final fresh = Record.fromSnapshot(freshSnapshot);

                        await transaction.update(record.reference, {'votes': fresh.votes + 1});
                      }
                    ),
                  ),
                ),
              );
            }).toList()
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Test',
        onPressed: () => Navigator.of(context).pushNamed('/addnewlist'),
      ),
    );
  }

  // Old Build Method, without firebase
  // @override
  // Widget build(BuildContext context) {
  //   final listBloc = ListProvider.of(context);
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Flutter Lists'),
  //     ),
  //     body: StreamBuilder<List<String>>(
  //       initialData: SimpleList().simpleList, // TODO: For the moment this initiates to an empty array. Later on will get data from db
  //       stream: listBloc.getItemList,
  //       builder: (context, snapshot) => ListView.builder(
  //         itemCount: snapshot.data.length,
  //         itemBuilder: (context, index) => ListTile(
  //           title: Text(snapshot.data[index]),
  //           trailing: Icon(Icons.arrow_forward_ios),
  //           onTap: () => 
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(builder: (context) => ListItemPage(item: snapshot.data[index])
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       child: Icon(Icons.add),
  //       tooltip: 'Test',
  //       onPressed: () => Navigator.of(context).pushNamed('/addnewlist'),
  //     ),
  //   );
  // }
}

class Record {
  final String name;
  final int votes;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['votes'] != null),
        name = map['name'],
        votes = map['votes'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  Map<String, dynamic> toJson() => {
    'name': name,
    'votes': votes,
  };

  @override
  String toString() => "Record<$name:$votes>";
}
