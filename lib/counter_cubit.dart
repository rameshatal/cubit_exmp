import 'dart:async';
import 'dart:math';

import 'package:cubit_exmp/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  //Initial state
  CounterCubit() : super(CounterState(arrData: []));

  //events
  void addData(Map<String, dynamic> data) {
    emit(CounterState(arrData: state.arrData, isLoading: true));

    Timer(Duration(seconds: Random().nextInt(5)), () {
     if(Random().nextInt(1000)%5==0){
       //error
       emit(CounterState(arrData: state.arrData,isError: true,errorMsg: "Error Occurred!!"));
     } else{
       var listData = state.arrData;
       listData.add(data);
       emit(CounterState(arrData: listData));
     }
    });
  }

  void deleteData(int index) {
    var listData = state.arrData;
    listData.removeAt(index);

    emit(CounterState(arrData: listData,));
  }

  /*void incrementCount() {
    emit(CounterState(count: state.count + 1));
  }

  void decrementCount() {
    if (state.count > 0) {
      emit(CounterState(count: state.count - 1));
    }
  }*/
}
