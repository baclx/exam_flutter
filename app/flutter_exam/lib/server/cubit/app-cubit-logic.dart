
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/pages/home-page.dart';
import 'package:flutter_exam/server/cubit/state/cubit-state.dart';

import 'app/app-cubit.dart';


class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<StatefulWidget> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is DestinationLoadedState) {
          return HomePage();
        }
        if (state is LoadingState) {
          return Center(
            child: Container(
              color: Colors.white,
              child: const CircularProgressIndicator(),
            ),
          );
        }
        return Container(
          child: Text('no state'),
          color: Colors.white,
        );
      },
    ));
  }
}
