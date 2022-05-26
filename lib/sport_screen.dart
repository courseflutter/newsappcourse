import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_newsapi/components.dart';
import 'package:flutter_newsapi/states.dart';

import 'bloc.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit().get(context);
        return ListView.separated(
            itemBuilder: (context, index) =>
                newsBuilder(cubit.sport[index], context),
            separatorBuilder: (context, index) => SizedBox(
                  height: 5,
                ),
            itemCount: cubit.sport.length);
      },
    );
  }
}
