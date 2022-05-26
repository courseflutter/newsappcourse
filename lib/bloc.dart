import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_newsapi/business_screen.dart';
import 'package:flutter_newsapi/dio_service.dart';
import 'package:flutter_newsapi/other_screen.dart';

import 'package:flutter_newsapi/sport_screen.dart';
import 'package:flutter_newsapi/states.dart';

class NewsCubit extends Cubit<NewAppStates> {
  NewsCubit() : super(NewsAppInitState());
  NewsCubit get(context) => BlocProvider.of(context);
  List screens = [BusinessScreen(), SportScreen(), OtherScreen()];
  int currentindex = 0;
  changeNavbar(index) {
    currentindex = index;
    emit(NewsAppChangeNavbarState());
  }

  List business = [];
  getBusiness() {
    emit(NewsAppLoadingBusinessSucceedState());
    DioHelper.getData('v2/top-headlines', {
      'country': 'us',
      'category': 'business',
      'apiKey': 'a269e4f1de864efc85f38b36f1bae318'
    }).then((value) {
      business = value?.data['articles'];
      print(business);
      emit(NewsAppGetBusinessSucceedState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsAppErrorBusinessSucceedState());
    });
  }

  List sport = [];
  getSport() {
    emit(NewsAppLoadingSportSucceedState());
    DioHelper.getData('v2/top-headlines', {
      'country': 'us',
      'category': 'sport',
      'apiKey': 'a269e4f1de864efc85f38b36f1bae318'
    }).then((value) {
      sport = value?.data['articles'];
      print(sport);
      emit(NewsAppGetSportSucceedState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsAppErrorSportSucceedState());
    });
  }

  List egypt = [];
  getNews() {
    emit(NewsAppLoadingEgyptSucceedState());
    DioHelper.getData('v2/top-headlines', {
      'country': 'eg',
      'category': 'sport',
      'apiKey': 'a269e4f1de864efc85f38b36f1bae318'
    }).then((value) {
      egypt = value?.data['articles'];
      print(egypt);
      emit(NewsAppGetEgyptSucceedState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsAppErrorEgyptSucceedState());
    });
  }

  List searchlist = [];
  getSearch(search) {
    emit(NewsAppGetSearchLoadingState());
    DioHelper.getData('v2/everything', {
      'q': '$search',
      'apiKey': 'a269e4f1de864efc85f38b36f1bae318'
    }).then((value) {
      searchlist = value?.data['articles'];
      print(searchlist);
      emit(NewsAppGetSearchSuccedState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsAppGetSearchErrorState());
    });
  }
}
