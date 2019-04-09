import 'package:flutter/material.dart';
import 'index_page.dart';
import './blocs/bloc_provider.dart';
import './blocs/increase_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: IncrementBloc(),
      child: MaterialApp(
        home: IndexPage(),
      ),
    );
  }
}