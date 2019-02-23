import 'package:flutter/material.dart';
import './add_new_list_bloc.dart';
export './add_new_list_bloc.dart';

class AddNewListProvider extends InheritedWidget{
  final bloc = AddNewListBloc();

  AddNewListProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static AddNewListBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AddNewListProvider) as AddNewListProvider).bloc;
  }
}