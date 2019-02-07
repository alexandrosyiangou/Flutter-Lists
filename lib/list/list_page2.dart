import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListPage2 extends StatelessWidget {
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
                    onTap: () => print(record),
                  ),
                ),
              );
            }).toList()
          );
        },
      ),
    );
  }
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

 @override
 String toString() => "Record<$name:$votes>";
}