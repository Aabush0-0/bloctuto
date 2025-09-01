/*

CUBIT: Simplified version of Bloc for easy state management

creating own counter cubit
*/

import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit(super.initialState);

  //increment
  void increment() => emit(state + 1);

  //decrement
  void decrement() => emit(state - 1);

  //on state change - do smth
  //   @override
  //   void onChange(Change<int> change) {
  //     super.onChange(change);

  //     print(change);
  //   }
}
