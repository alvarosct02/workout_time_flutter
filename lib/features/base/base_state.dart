import 'package:flutter/material.dart';
import 'package:workout_timer/features/base/base_bloc.dart';

abstract class BaseState<W extends StatefulWidget, B extends BaseBloc> extends State<W> {

  @protected
  B bloc;

  @protected
  bool isLoading = false;

  @protected
  void setupBloc();

  @override
  void initState() {
    setupBloc();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
