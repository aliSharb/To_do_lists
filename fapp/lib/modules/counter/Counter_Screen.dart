import 'package:fapp/modules/counter/cubit/cubit.dart';
import 'package:fapp/modules/counter/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {
          if (state is CounterBlusState) {}
          if (state is CounterMinusState) {}
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('counter',
                  style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        CounterCubit.get(context).minus();
                        print(CounterCubit.get(context).counter);
                      },
                      child: Text('minuses')),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      '${CounterCubit.get(context).counter}',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        CounterCubit.get(context).bluse();
                        print(CounterCubit.get(context).counter);
                      },
                      child: Text('plus')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
