/*

Counter page: responsible for providing CounterCubit to CounterView (UI)

-use BlocProvider
*/

import 'package:Bloc/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_view.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    //bloc provider
    return BlocProvider(
      create: (context) => CounterCubit(0),

      child: BlocListener<CounterCubit, int>(
        listener: (context, state) {
          //show pop up box when reaches 20
          if (state % 10 == 0) {
            showDialog(
              context: context,
              builder: (context) =>
                  AlertDialog(content: Text('$state reached')),
            );
          }
        },
        //counter view UI
        child: CounterView(),
      ),
    );
  }
}
