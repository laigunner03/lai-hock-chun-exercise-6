import 'package:bloc/bloc.dart';

class CubitConvert extends Cubit<String> {
  CubitConvert() : super('');

  void wordCapitalize(word) => emit(word.toUpperCase());
}
