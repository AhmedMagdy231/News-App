import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
Widget buildNewsItem(article,context)=>InkWell(
  onTap: (){
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>Web_View(article['url'])));
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width: 120.0,

          height: 120.0,

          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(20),

          ),

          child: ClipRRect(

            borderRadius: BorderRadius.circular(20),

            child: CachedNetworkImage(

              imageUrl: article['urlToImage']!=null?article['urlToImage']:'',

              placeholder: (context, url) => Center(child: CircularProgressIndicator()),

              errorWidget: (context, url, error) => Icon(Icons.error,color: Colors.red,),

              fit: BoxFit.cover,



            ),

          ),

        ),

        SizedBox(width: 20,),

        Expanded(

          child: Container(

            height: 120,

            child: Column(

              mainAxisSize: MainAxisSize.min,

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Expanded(

                    child: Text(article['title'],style: Theme.of(context).textTheme.bodyText1,overflow: TextOverflow.ellipsis,maxLines: 3,)),

                Text(article['publishedAt'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),)

              ],

            ),

          ),

        ),

      ],

    ),

  ),
);