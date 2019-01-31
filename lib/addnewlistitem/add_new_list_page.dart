import 'package:flutter/material.dart';

class AddNewListPage extends StatelessWidget {

static const routeName = '/addnewlist';

AddNewListPage();

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New List'),
        leading: BackButton(),
      ),
    );
  }
}