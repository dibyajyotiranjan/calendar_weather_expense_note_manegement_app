import 'package:flutter/material.dart';
import 'package:odiacalendar2023/Screen/index.dart';
import 'package:odiacalendar2023/database/note_database.dart';

Widget allTrans(List<Map<String,dynamic>>monthtrns) {
  // return SizedBox(height: 50,width: 50,);
  return Column(
    children: [
      Container(
        alignment: Alignment.bottomCenter,
        height: 40,
        decoration: const BoxDecoration(
          color: Colors.white,

        ),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        //Icon(Icons.exposure_minus_1),
        const Text("ତାରିଖ", style: TextStyle(color: Colors.red,fontSize: 20,)),
        const Text("ସମୟ",style: TextStyle(color: Colors.red,fontSize: 20)),
        const Text("ବିବରଣୀ",style: TextStyle(color: Colors.red,fontSize: 20)),
        const Text("ଖର୍ଚ୍ଚଟଙ୍କା",style: TextStyle(color: Colors.red,fontSize: 20)),

        ],
        ),
      ),
      Expanded(
        child: ListView.builder(
            itemCount: monthtrns.length,
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                detailTrans(context,monthtrns[index])),
      ),

    ],
  );
}


Widget detailTrans(BuildContext context, Map<String,dynamic> detailTrans) {
  return SizedBox(
    height: 60,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
       InkWell(
         onTap: (){
           DbHelper().delet_expanse(detailTrans["expense_id"]);
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage(index: 3,)));

         },
           child: Icon(Icons.delete,color: Colors.red,)),
        Text(detailTrans["date"]==null?"":detailTrans["date"],style: const TextStyle(color: Colors.white,fontSize: 15)),
        Text(detailTrans["time"]==null?"":detailTrans["time"],style: const TextStyle(color: Colors.white,fontSize: 15)),
        Text(detailTrans["expanse_cat"]==null?"":detailTrans["expanse_cat"],style: const TextStyle(color: Colors.yellow,fontSize: 17,fontWeight: FontWeight.bold)),
        InkWell(
          onTap: ()async{
            await showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  alignment: Alignment.center,
                  backgroundColor: Colors.black12,
                  title: Column(
                      children: [
                        const Text("Title",style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.bold)),
                        Text(detailTrans["expanse_title"]==null?"":detailTrans["expanse_title"],style: const TextStyle(wordSpacing: 3, letterSpacing: 2, color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold)),]),
                  content: Container(
                    color: Colors.blue,
                    padding: const EdgeInsets.only(left: 10,right: 17),
                    height: 200,
                    child: Column(
                        children: [
                          const Text("Description",style: TextStyle(color: Colors.red,fontSize: 22)),
                          Text("${detailTrans["expense_des"]==null?"":detailTrans["expense_des"].toString()}..",style: const TextStyle(color: Colors.white,fontSize: 15)),
                        ]),
                  )
                );
              }
            );
          },
          child: const Text("details",style: TextStyle(color: Colors.white,fontSize: 20,backgroundColor: Colors.red)),
        ),
        Text(detailTrans["amount"]==null?"":"\u{20B9} ${detailTrans["amount"].toString()}",style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),

      ],
    ),
  );
}
