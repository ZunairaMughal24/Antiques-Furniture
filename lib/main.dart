import 'package:antiques_furniture/config/router.dart';
import 'package:antiques_furniture/core/const/app_theme.dart';
import 'package:antiques_furniture/features/categories/data/repositories/photo_repository.dart';
import 'package:antiques_furniture/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PhotoBloc(PhotoRepositoryImpl())),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
