import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'blocs/bloc_provider.dart';
import 'blocs/increase_bloc.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<IncrementBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC'),
        elevation: 0.0,
      ),
      body: StreamBuilder(
        initialData: 0,
        stream: bloc.counterStream,
        builder: (context,snapshot){
          return Center(
            child: ActionChip(
              onPressed: (){
                bloc.actionSink.add(null);
              },
              label: Text('${snapshot.data}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
            bloc.actionSink.add(null);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}