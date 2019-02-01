import 'package:flutter/widgets.dart';
import 'list_bloc.dart';

class ListProvider extends InheritedWidget {
  final ListBloc listBloc;

  //TODO: Make this a generic state manager that will accept any bloc, and be able to get/set data for any bloc
  ListProvider({
    Key key,
    ListBloc listBloc,
    Widget child,
  })  : listBloc = listBloc ?? ListBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ListBloc of(BuildContext context) =>
    (context.inheritFromWidgetOfExactType(ListProvider) as ListProvider).listBloc;
}
