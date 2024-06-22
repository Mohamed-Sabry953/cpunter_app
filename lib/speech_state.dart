part of 'speech_cubit.dart';

@immutable
abstract class SpeechState {}

class SpeechInitial extends SpeechState {}
class SpeechStartState extends SpeechState {}
class SpeechTOTextSucState extends SpeechState {}
class SpeechStopState extends SpeechState {}
class SpeechHelloState extends SpeechState {}
class SpeechGoodMorningState extends SpeechState {}
class SpeechStartAgainState extends SpeechState {}
