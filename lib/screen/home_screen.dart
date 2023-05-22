import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/appcolot.dart';
import '../widget/buttonwidget.dart';
import 'add_task.dart';
import 'all_task.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    "assets/1.jpg"
                )
            )
        ),padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(text: TextSpan(text: 'Hello', style: TextStyle(
              color: AppColors.mainColor,
              fontWeight: FontWeight.bold,
              fontSize: 60,
            ),
                children : [
                  TextSpan(
                      text: "\nStart Your beautiful journey"
                      ,style: TextStyle(
                      fontSize: 15,
                      color: Colors.indigoAccent,
                      fontWeight: FontWeight.bold
                  )
                  )
                ]
            )
            ),
            SizedBox(height: MediaQuery.of(context).size.height/2.5,),
            Padding(
              padding: const EdgeInsets.only(left: 40 ,right: 40),
              child: InkWell(
                onTap: (){
                  Get.to(()=>AddTask(), transition: Transition.upToDown, duration: Duration(milliseconds: 1000));
                },
                child: Container(
                  width: 300,
                  child: ButtonWidget(backgroundcolor: AppColors.mainColor,
                      text: 'Add Task', textColor: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(

              padding: const EdgeInsets.only(left: 40,right: 40),
              child: InkWell(
                onTap: (){
                  Get.to(()=>AllTask(), transition: Transition.downToUp,duration: Duration(milliseconds: 500));
                },
                child: Container(
                  width: 300,
                  child: ButtonWidget(backgroundcolor: Colors.white,
                      text: 'View All', textColor: AppColors.mainColor),
                ),
              ),
            )
          ],
        ) ,
      ),
    );
  }
}

