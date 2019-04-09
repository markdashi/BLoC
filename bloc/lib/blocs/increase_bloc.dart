import 'dart:async';
import 'bloc_base.dart';

class IncrementBloc implements BlocBase{
  int _count;
  
  // Stream to handle the counter 第一组stream
  StreamController _counterController = StreamController();
  StreamSink get _inAdd => _counterController.sink;
  Stream get counterStream => _counterController.stream;

  // Stream to handle the action on the counter,第二组streams
  StreamController _actionController = StreamController();
  StreamSink get actionSink => _actionController.sink;

  IncrementBloc(){
    _count = 0;
    _actionController.stream.listen(increase);
  }

  increase(data){
    _count += 1;
    _inAdd.add(_count);
  }
  void dispose() { 
    _actionController.close();
    _counterController.close();
  }
}