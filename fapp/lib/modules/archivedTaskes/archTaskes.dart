import 'dart:developer';

import 'package:fapp/shared/components/components.dart';
import 'package:fapp/shared/components/constans.dart';
import 'package:fapp/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/HomeLayout.dart';
import '../../shared/cubit/cubit.dart';

class ArchivedTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        var allArchTasks = AppCubit.get(context).allArchTasks;
        return taskesBullder(task: allArchTasks);
      },
      listener: (context, state) {},
    );
  }
}
