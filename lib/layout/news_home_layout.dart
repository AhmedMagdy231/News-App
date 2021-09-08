
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app_abdo/cubit/cuibt.dart';
import 'package:new_app_abdo/cubit/states.dart';
import 'package:new_app_abdo/modules/search/search.dart';
import 'package:new_app_abdo/network/remote/dio_helper.dart';

class NewsAppLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewCubit,NewStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = NewCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('News App'),
              actions: [
                IconButton(icon: Icon(Icons.search), onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));

                }),
                IconButton(icon: Icon(Icons.brightness_4_outlined), onPressed: (){
                  NewCubit.get(context).changeThemeMode();
                }),

              ],
            ),
            body: cubit.MyScreen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.myItemNav,
              onTap: (index){
                cubit.ChangeBottomNav(index);

              },
              currentIndex: cubit.currentIndex,
            ),

          );
        },


    );
  }
}
