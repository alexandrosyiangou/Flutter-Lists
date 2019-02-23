import 'package:flutter/material.dart';
import './list_bloc.dart';
export './list_bloc.dart';

class ListBlocProvider extends InheritedWidget{
  final bloc = ListBloc();

  ListBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static ListBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ListBlocProvider) as ListBlocProvider).bloc;
  }
}