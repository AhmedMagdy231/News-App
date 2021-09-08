
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app_abdo/cubit/cuibt.dart';
import 'package:new_app_abdo/cubit/states.dart';
import 'package:new_app_abdo/shared/Component/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit, NewStates>(
        builder: (context, state) {
          var list = NewCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.bodyText1,
                    onChanged: (value){
                      NewCubit.get(context).getSearchData(value);
                      print(list.length);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: 'Search',
                      labelStyle: Theme.of(context).textTheme.bodyText1,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: NewCubit.get(context).isDark
                                ? Colors.white
                                : Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                            color: NewCubit.get(context).isDark
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child:ConditionalBuilder(
                      condition: list.length>0,
                      builder: (context)=> ListView.separated(
                          itemBuilder: (context, index) {
                            return buildNewsItem(list[index],context);
                          },
                          physics: BouncingScrollPhysics(),
                          separatorBuilder: (context,index)=>SizedBox(child: Divider(thickness: 2,),),
                          itemCount: list.length),
                      fallback: (context)=>Center(child: CircularProgressIndicator()),
                    ), ),
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}
