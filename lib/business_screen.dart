import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_newsapi/bloc.dart';
import 'package:flutter_newsapi/components.dart';
import 'package:flutter_newsapi/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit().get(context);
        return ListView.separated(
            itemBuilder: (context, index) => newsBuilder(cubit.business[index]),
            separatorBuilder: (context, index) => SizedBox(
                  height: 5,
                ),
            itemCount: cubit.business.length);
      },
    );
  }
}
