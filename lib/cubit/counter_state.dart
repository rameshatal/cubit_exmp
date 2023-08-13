class CounterState {
  //int count;
  //task
  List<Map<String, dynamic>> arrData;
  bool isLoading;
  bool isError;
  String errorMsg;

  CounterState(
      {required this.arrData,
        this.isLoading = false,
        this.isError = false,
        this.errorMsg = ""});
}

/*class InitialState extends CounterState{}
class LoadingState extends CounterState{}
class LoadedState extends CounterState{
  List<Map<String, dynamic>> arrData;
  LoadedState({required this.arrData});
}
class ErrorState extends CounterState{
  String errorMsg;
  ErrorState({required this.errorMsg});
}*/