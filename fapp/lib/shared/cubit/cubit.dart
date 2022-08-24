import 'package:fapp/shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/archivedTaskes/archTaskes.dart';
import '../../modules/doneTaskes/doneTaskes.dart';
import '../../modules/newTaskes/newTaskes.dart';
import '../components/constans.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  List<Widget> screenList = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> title = [
    'Task Screen',
    'Done Tasks screen',
    'Archived Tasks Screen'
  ];
  int currentIndexItem = 0;
  List<Map> allNewTasks = [];
  List<Map> allDoneTasks = [];
  List<Map> allArchTasks = [];

  Database? database;

  void changeindex(int indix) {
    currentIndexItem = indix;
    emit(AppChangeBottomNavBarState());
  }

  void creatDatabase() {
    openDatabase('To_do.db', version: 1, onCreate: (database, version) {
      print('table created');
      database
          .execute(
              'CREATE TABLE To_do (id INTEGER PRIMARY KEY, title TEXT,time TEXT, date TEXT, status TEXT)')
          .then((value) {})
          .catchError((error) {
        print('error at creat table $error');
      });
      print('database creared');
    }, onOpen: (database) {
      GetFromDatabase(database);

      print(' databaseOpend');
    }).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertIntoDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    await database?.transaction((txn) {
      return txn.rawInsert(
          'Insert Into To_do(title,date,time,status) VALUES ("$title","$date","$time","new")');
    }).then((value) {
      print('insret succssefuly  $value');
      emit(AppInsertDatabaseState());
      GetFromDatabase(database);
    }).catchError((onError) {
      print('error at insert $onError');
    });
  }

  void GetFromDatabase(database) {
    allNewTasks = [];
    allArchTasks = [];
    allDoneTasks = [];
    database.rawQuery('SELECT * FROM To_do').then((value) {
      value.forEach(
        (element) {
          if (element['status'] == 'new') allNewTasks.add(element);
          if (element['status'] == 'Done') allDoneTasks.add(element);
          if (element['status'] == 'Arch') allArchTasks.add(element);
        },
      );
      emit(AppGetDatabaseState());
    });
  }

  bool isBottomSheetShown = false;
  IconData bottonIcon = Icons.edit;
  void changeBottomSheetState(
      {required bool show, required IconData iconData}) {
    isBottomSheetShown = show;
    bottonIcon = iconData;
    emit(AppChangeBottomSheetState());
  }

  updateDatabase({required String status, required int id}) {
    database?.rawQuery(
        'UPDATE To_do SET status=? WHERE id=?', ['$status', id]).then((value) {
      GetFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  DeleteFromDatabase({required int id}) {
    database?.rawDelete('DELETE From To_do WHERE id=?', [id]).then((value) {
      GetFromDatabase(database);
      emit(DeleteFromDatabaseState());
    });
  }
}
