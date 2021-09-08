import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:new_app_abdo/cubit/cuibt.dart';
import 'package:new_app_abdo/cubit/states.dart';
import 'package:new_app_abdo/network/local/cach_hepler.dart';
import 'package:new_app_abdo/network/remote/dio_helper.dart';
import 'package:new_app_abdo/shared/bloc_observer.dart';

import 'layout/news_home_layout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashHelper.init();
   bool isDark = CashHelper.getData(key: 'isDark');



  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp( this.isDark);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NewCubit()..getBusinessData()..changeThemeMode(fromShared: isDark),
      child: BlocConsumer<NewCubit,NewStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            showSemanticsDebugger: false,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              primarySwatch: Colors.deepOrange,


              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),


              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness:  Brightness.dark,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,

                ),
                color: Colors.white,
                backwardsCompatibility: false,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,


                ),


              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepOrange,
                type: BottomNavigationBarType.fixed,
              ),
              scaffoldBackgroundColor: Colors.white,
            ),
            darkTheme: ThemeData(
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              scaffoldBackgroundColor: HexColor('333739'),
              primarySwatch: Colors.deepOrange,

              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),


              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness:  Brightness.light,
                ),
                iconTheme: IconThemeData(
                  color: Colors.white,

                ),
                color:  HexColor('333739'),
                backwardsCompatibility: false,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,


                ),


              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepOrange,
                type: BottomNavigationBarType.fixed,
                backgroundColor:  HexColor('333739'),
                unselectedItemColor: Colors.grey,
              ),
            ),
            themeMode: NewCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light,
            home: NewsAppLayout(),
          );
        },
      ),
    );
  }
}
