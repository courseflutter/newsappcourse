import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_newsapi/bloc.dart';
import 'package:flutter_newsapi/states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewAppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit().get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text('NewsApp'),
              ),
              body: cubit.screens[cubit.currentindex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentindex,
                onTap: (index) => cubit.changeNavbar(index),
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.business_center), label: 'Business'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.sports_basketball_rounded),
                      label: 'Sport'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings_accessibility_sharp),
                      label: 'Other'),
                ],
              ),
            );
          }),
    );
  }
}
