import 'package:flutter/material.dart';
import 'package:imake/routes/pages.dart';
import 'package:imake/splash_screen.dart';
import 'package:imake/tasks/data/local/model/task_model.dart';
import 'package:imake/tasks/presentation/pages/about_screen.dart';
import 'package:imake/tasks/presentation/pages/login_screen.dart';
import 'package:imake/tasks/presentation/pages/new_task_screen.dart';
import 'package:imake/tasks/presentation/pages/register_screen.dart';
import 'package:imake/tasks/presentation/pages/tasks_screen.dart';
import 'package:imake/tasks/presentation/pages/update_task_screen.dart';

import '../page_not_found.dart';

Route onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Pages.initial:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );
    case Pages.createNewTask:
      return MaterialPageRoute(
        builder: (context) => const NewTaskScreen(),
      );
    case Pages.updateTask:
      final args = routeSettings.arguments as TaskModel;
      return MaterialPageRoute(
        builder: (context) => UpdateTaskScreen(taskModel: args),
      );
    case Pages.tasksScreen:
      return MaterialPageRoute(
        builder: (context) => const TasksScreen(),
      );
    case Pages.about:
      return MaterialPageRoute(
        builder: (context) => const AboutScreen(),
      );
    case Pages.register:
      return MaterialPageRoute(
        builder: (context) => const RegisterScreen(),
      );
    case Pages.login:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const PageNotFound(),
      );
  }
}
