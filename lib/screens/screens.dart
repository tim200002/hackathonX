import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_realtime_detection/bloc/mainBloc.dart';
import 'package:flutter_realtime_detection/screens/LadenScreen.dart';
import 'package:flutter_realtime_detection/states/MainStates.dart';

class Screens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainBloc, MainStates>(
        builder: (context, state) {
          if (state is ImLaden) {
            return LadenScreen(state.cameras);
          } else if (state is InQuest) {
            var actualQuest = state.quest[state.position];
            if(actualQuest[2]==true){
              //Show Screen with Camera Icon
            }
            else if(actualQuest[2]==false){
              //Show Screen with just text
            }
          }
        },
      ),
    );
  }
}
