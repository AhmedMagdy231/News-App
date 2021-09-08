

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app_abdo/cubit/states.dart';
import 'package:new_app_abdo/modules/business/business_screen.dart';
import 'package:new_app_abdo/modules/science/science.dart';
import 'package:new_app_abdo/modules/setting/setting.dart';
import 'package:new_app_abdo/modules/sport/sport.dart';
import 'package:new_app_abdo/network/local/cach_hepler.dart';
import 'package:new_app_abdo/network/remote/dio_helper.dart';

class NewCubit extends Cubit<NewStates> {
  NewCubit() : super(NewInitialState());

  static NewCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> myItemNav = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_basketball), label: 'Sport'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  List<Widget> MyScreen = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];

  void ChangeBottomNav(int index) {
    currentIndex = index;
    if (currentIndex == 1) getSportData();
    if (currentIndex == 2) getScienceData();
    emit(NewBottomNavState());
  }

  List<dynamic> business = [];

  void getBusinessData() {
    emit(NewsLoadingBusinessState());
    DioHelper.getDate(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'c81ed09dc7014a06a5606cc73324e409',
      },
    ).then((value) {
      //  print(value.data.toString());
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sport = [];

  void getSportData() {
    if (sport.length == 0) {
      emit(NewsLoadingSportState());
      DioHelper.getDate(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sport',
          'apiKey': 'c81ed09dc7014a06a5606cc73324e409',
        },
      ).then((value) {
        //  print(value.data.toString());
        sport = value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetSportSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScienceData() {
    if(science.length==0){
      emit(NewsLoadingScienceState());
      DioHelper.getDate(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': 'c81ed09dc7014a06a5606cc73324e409',
        },
      ).then((value) {
        //  print(value.data.toString());
        science = value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetScienceSuccessState());

      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });

    }else{
      emit(NewsGetScienceSuccessState());

    }

  }

  List<dynamic> search = [];

  void getSearchData(String value){
    DioHelper.getDate(
        url: 'v2/everything',
        query: {
          'q':'${value}',
          'apiKey': 'c81ed09dc7014a06a5606cc73324e409',
        },
    ).then((value){

      search=value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });



  }











  bool isDark=false;
  void changeThemeMode({bool fromShared}){
    if(fromShared != null)
      {
        isDark=fromShared;
        emit(NewsChangeThemeModeState());
      }

    else
      {
        isDark= !isDark;

        CashHelper.putData(key: 'isDark', value: isDark).then((value){
          emit(NewsChangeThemeModeState());

        });
      }


  }


}
