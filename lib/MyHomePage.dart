import 'package:cpunter_app/speech_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyHomePage extends StatelessWidget {
  @override
    int helloCounter=0;
    int goodCounter=0;
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => SpeechCubit()..initSpeech(),
    child: BlocConsumer<SpeechCubit,SpeechState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    helloCounter.toString(),
                    style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    ": عدد مرات السلام عليكم ",
                    style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text( goodCounter.toString(),
                      style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500)),
                  Text(": عدد مرات صباح الخير ",
                      style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500))
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(onPressed: () {
                  SpeechCubit.get(context).startListening();
                },
                    child: Center(
                      child: Text("بدأ",style: TextStyle(
                          fontSize: 18.sp
                      ),),
                    )),
              ),
              SizedBox(height: 5.h,),
              SizedBox(
                width: 150,
                child: ElevatedButton(onPressed: () {
                  SpeechCubit.get(context).stopListening();
                },
                    child: Center(
                      child: Text("ايقاف",style: TextStyle(
                          fontSize: 18.sp
                      ),),
                    )),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        if(state is SpeechGoodMorningState ){
          goodCounter+=SpeechCubit.get(context).goodMorningCounter-1;

        }
        if(state is SpeechHelloState ){
          helloCounter+=SpeechCubit.get(context).helloCounter;
        }
      },
    ),);
  }
}
