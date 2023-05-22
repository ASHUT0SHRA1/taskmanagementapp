import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanagementapp/controller/datacontroller.dart';

import '../utils/appcolot.dart';
import '../widget/buttonwidget.dart';
import '../widget/task_widget.dart';
class AllTask extends StatelessWidget {
  const AllTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Get.find<DataController>().myData.length);
    List myData = [
      "Try harder",
      "Try  Smarter"
    ];
    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color(0xFF2e3253),
      alignment: Alignment.centerLeft,
      child:  const Icon(
        Icons.edit,
        color: Colors.white,
      ),
    );
    final rightDeleteIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color:  Colors.red,
      child:  const Icon(
        Icons.delete,
        color: Colors.white,

      ),
      alignment: Alignment.centerRight  ,
    );
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [

          Container(

            padding: const EdgeInsets.only(left: 20,top: 50),
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: (){
                Get.back();
              },
              child:  Icon(Icons.arrow_back, color: Colors.white,size: 35,),
            ),
            width: double.maxFinite,
            height : MediaQuery.of(context).size.height/3.2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "assets/2.jpg"
                    )
                )
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
              child: Row(
                children: [
                  Icon(Icons.home, color: Colors.blueAccent,size: 30,),
                  SizedBox( width: 20,),
                  Container(
                    child: Icon(Icons.add, color:  Colors.white, size: 20,),
                    width: 25,
                    height: 24,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.5),
                        color: Colors.black87
                    ),
                  ),
                  Expanded(child: Container()),
                  Icon(Icons.calendar_month_sharp , color: Colors.blue,),
                  SizedBox(width: 10,),
                  Text('2', style: TextStyle(
                      fontSize: 20,
                      color: AppColors.secondaryColor
                  ),)
                ],
              ),
            ),
          ),
          Flexible(
            child: GetBuilder<DataController>(builder: (controller){
            return ListView.builder(
                itemCount: myData.length,
                itemBuilder: (context,index){
                  return Dismissible(
                    background: leftEditIcon,
                    secondaryBackground: rightDeleteIcon,
                    onDismissed: (DismissDirection direction){
                      print('After Dismiss');
                    },
                    confirmDismiss:(DismissDirection direction)async{
                      if(direction == DismissDirection.startToEnd){
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            barrierColor: Colors.transparent,
                            context: context, builder:
                            (_){
                          return Container(

                              height: 300,
                              decoration: BoxDecoration(

                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/4.jpg"
                                          )
                                      ),
                                  color: Colors.blue.shade100
                                  ,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Column(
                                  children: [
                                    ButtonWidget(backgroundcolor: AppColors.mainColor, text: "view", textColor: Colors.white),
                                    SizedBox(height: 10,),
                                    ButtonWidget(backgroundcolor: AppColors.mainColor, text: "Edit", textColor: Colors.white),
                                  ],
                                ),
                              ) );
                        }
                        );

                        return false;
                      }
                      else{
                        return Future.delayed(Duration(seconds: 1),() => (direction == DismissDirection.endToStart ));
                      }
                      return true;
                    },
                    key: ObjectKey(index),

                    child: Container(

                      margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
                      child: TaskWidget(
                        text: myData[index], color: Colors.black87,
                      ),
                    ),
                  );
              });
    }),
          ),
        ],
      ),
    );
  }
}
