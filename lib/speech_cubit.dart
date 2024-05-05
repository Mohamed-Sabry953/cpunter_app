import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
part 'speech_state.dart';

class SpeechCubit extends Cubit<SpeechState> {
  SpeechCubit() : super(SpeechInitial());
  static SpeechCubit get(context) => BlocProvider.of(context);
  SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;
  String lastWords = '';
  int helloCounter = 0;
  int goodMorningCounter = 0;
  Set<String>morning={};
  List<String>goodMorning=[];

  void initSpeech() async {
    speechEnabled = await speechToText.initialize();
    emit(SpeechInitial());
  }
   onSpeechResult(SpeechRecognitionResult result) async {
       lastWords =  result.recognizedWords;
    emit(SpeechTOTextSucState());
     switch(lastWords){
       case "صباح الخير":
         goodMorningCounter++;
         emit(SpeechGoodMorningState());
         break;
       case "السلام عليكم":
         helloCounter++;
         emit(SpeechHelloState());
         break;
       default :
         lastWords="";
     }
     startListening();
  }

  void startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    emit(SpeechStartState());
  }

  void stopListening() async {
    goodMorningCounter=0;
    helloCounter=0;
    await speechToText.stop();
    emit(SpeechStopState());
  }
}
