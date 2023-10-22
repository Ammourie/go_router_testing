import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'number_state.dart';

class NumberCubit extends Cubit<NumberState> {
  NumberCubit() : super(const NumberState(10));
}
