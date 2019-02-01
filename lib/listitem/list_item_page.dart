import 'package:flutter/material.dart';

class ListItemPage extends StatelessWidget {

static const routeName = '/listitem';

final String item;

ListItemPage({
  this.item
});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.item),
        leading: BackButton(),
      ),
    );
  }
}