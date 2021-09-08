import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app_abdo/cubit/cuibt.dart';
import 'package:new_app_abdo/cubit/states.dart';
import 'package:new_app_abdo/shared/Component/components.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit, NewStates>(
      builder: (context, state) {
        var list=NewCubit.get(context).science;
        return ConditionalBuilder(
          condition: list.length>0,
          builder: (context)=>ListView.separated(itemBuilder: (context,index)=>buildNewsItem(list[index],context),
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context,index)=>SizedBox(child: Divider(thickness: 2,),),
              itemCount: list.length),
          fallback: (context)=>Center(child: CircularProgressIndicator(),),

        );
      },
      listener: (context, state) {},
    );
  }
}
