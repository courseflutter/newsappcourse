import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_newsapi/states.dart';

import 'bloc.dart';
import 'components.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit().get(context);
        return ListView.separated(
            itemBuilder: (context, index) =>
                newsBuilder(cubit.egypt[index], context),
            separatorBuilder: (context, index) => SizedBox(
                  height: 5,
                ),
            itemCount: cubit.egypt.length);
      },
    );
  }
}
