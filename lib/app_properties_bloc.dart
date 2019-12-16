import 'dart:async';

final appBloc = AppPropertiesBloc();

class AppPropertiesBloc{
  StreamController<String> _title = StreamController<String>();
  StreamController<bool> _back = StreamController<bool>();
  var context;
  String title = "Save notes";
  bool backStatus = false;

  Stream<String> get titleStream => _title.stream;
  Stream<bool> get backStream => _back.stream;

  updateTitle(String newTitle){
    _title.sink.add(newTitle);
    this.title = newTitle;
  }
  updateBack(bool backStatus){
    _back.sink.add(backStatus);
    this.backStatus = backStatus;
  }
  getContext(){
    return context;
  }
  setContext(newContext){
    this.context = newContext;
  }
  getBack(){
    return backStatus;
  }
  getTitle(){
    return title;
  }
  dispose() {
    _title.close();
    _back.close();
  }
}