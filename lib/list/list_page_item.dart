import 'package:flutter/material.dart';

class ListPageItem extends StatelessWidget {
  final String item;

  ListPageItem({
    this.item
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(Icons.arrow_forward_ios),
      title: Text(item),
      onTap: () => Navigator.of(context).pushNamed('/listitem'), //TODO: Tricky situation.. How to load the according data? Or how to pass the data with routing?
    );
    // return Center(child: Text(item)); //TODO: Custom ListItem
  }
}
