import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_newsapi/bloc.dart';
import 'package:flutter_newsapi/states.dart';
import 'package:flutter_newsapi/webview_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit().get(context);
    return BlocConsumer<NewsCubit, NewAppStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text('Search'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 20,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onChanged: (value) {
                    cubit.getSearch(value);
                  },
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ListTile(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              WebScreen(cubit.searchlist[index]['url']),
                        )),
                        leading: Container(
                          child: Image.network(
                              cubit.searchlist[index]['urlToImage'].toString()),
                        ),
                        title:
                            Text(cubit.searchlist[index]['title'].toString()),
                      ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: cubit.searchlist.length)
            ],
          ),
        ),
      ),
    );
  }
}
