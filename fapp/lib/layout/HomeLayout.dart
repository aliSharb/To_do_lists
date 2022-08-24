import 'package:fapp/modules/archivedTaskes/archTaskes.dart';
import 'package:fapp/modules/doneTaskes/doneTaskes.dart';
import 'package:fapp/modules/newTaskes/newTaskes.dart';
import 'package:fapp/shared/components/components.dart';
import 'package:fapp/shared/cubit/cubit.dart';
import 'package:fapp/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../shared/components/constans.dart';

class HomeLayout extends StatelessWidget {
  @override
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titlecontroler = TextEditingController();
  var timecontroler = TextEditingController();
  var datecontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit()..creatDatabase(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {
            if (state is AppInsertDatabaseState) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            return Scaffold(
              key: scaffoldKey,
              appBar:
                  AppBar(title: Text('${cubit.title[cubit.currentIndexItem]}')),
              body: cubit.screenList[cubit.currentIndexItem],
              floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    if (cubit.isBottomSheetShown) {
                      if (formKey.currentState!.validate()) {
                        cubit.insertIntoDatabase(
                          date: datecontroler.text,
                          time: timecontroler.text,
                          title: titlecontroler.text,
                        );
                      }
                    } else {
                      scaffoldKey.currentState!
                          .showBottomSheet(
                            (context) => Container(
                              padding: EdgeInsets.all(10),
                              color: Colors.grey,
                              child: Form(
                                key: formKey,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      defFormField(
                                        controller: titlecontroler,
                                        validMassage: 'must not be empty',
                                        lableText: 'Task Title',
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      defFormField(
                                        controller: timecontroler,
                                        keyboardType: TextInputType.datetime,
                                        validMassage: 'must not be empty',
                                        ontab: () {
                                          showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay.now())
                                              .then((value) {
                                            timecontroler.text =
                                                value!.format(context);
                                          });
                                        },
                                        lableText: 'Task Time',
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      defFormField(
                                          controller: datecontroler,
                                          keyboardType: TextInputType.datetime,
                                          validMassage: 'must not be empty',
                                          lableText: 'Task date',
                                          ontab: () {
                                            showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime.now(),
                                                    lastDate: DateTime.parse(
                                                        '2023-07-20'))
                                                .then((value) {
                                              datecontroler.text =
                                                  DateFormat.yMMMMd()
                                                      .format(value!);
                                            });
                                          }),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                          .closed
                          .then((value) {
                        cubit.changeBottomSheetState(
                            show: false, iconData: Icons.edit);
                      });
                      cubit.changeBottomSheetState(
                          show: true, iconData: Icons.add);
                    }
                  },
                  child: Icon(cubit.bottonIcon)),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                currentIndex: cubit.currentIndexItem,
                onTap: (index) {
                  cubit.changeindex(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.menu),
                    label: 'Taskes',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.check), label: 'done'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.archive_sharp), label: 'Archaive'),
                ],
              ),
            );
          },
        ));
  }
}
