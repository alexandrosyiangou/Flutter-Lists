import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './add_new_list_screen.dart';
import '../blocs/list_bloc_provider.dart';

class ListScreen extends StatefulWidget {
  // final List<String> lists;

  // ListScreen({this.lists});

  @override
  ListScreenState createState() {
    return ListScreenState();
  }
}

class ListScreenState extends State<ListScreen> {
  ListBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = ListBlocProvider.of(context);
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
      body: StreamBuilder(
        stream: _bloc.fetchAllLists(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DocumentSnapshot> lists = snapshot.data.documents;
            List<String> allLists = _bloc.mapToList(docList: lists);
            if (allLists.isNotEmpty) {
              return ListView.builder(
                itemCount: allLists.length,
                itemBuilder: (context, index) =>
                  ListTile(
                    title: Text(allLists[index]),
                  ),
              );
            } else {
              return Text('No Data');
            }
          } else {
            return Text('No Data');
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Test',
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddNewListScreen(),
          ),
        )
      ),
    );
  }
}
