
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/pages/home-page.dart';
import 'package:flutter_exam/server/cubit/app-cubit-logic.dart';
import 'package:flutter_exam/server/cubit/app/app-cubit.dart';
import 'package:flutter_exam/server/service/data-service.dart';



void main() {
  runApp(const MyApp());
}
var routes = {
  '/home': (context) => HomePage(),
};
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubits(dataService: DataService()),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routes: routes,
        home: Builder(
          builder: (context){
           // SizeConfig.init(context);
            return AppCubitLogics();
          },
        ),
      ),
    );
  }
}