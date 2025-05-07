import 'package:bloc/bloc.dart';
import 'package:built_value/built_value.dart';

export 'dart:async';

abstract class AppCubit<State> extends Cubit<State> {
  AppCubit(super.initialState);

  @override
  void emit(final State state) {
    if (isClosed) {
      return;
    }
    super.emit(state);
  }
}

abstract class BVCubit<V extends Built<V, B>, B extends Builder<V, B>>
    extends AppCubit<V> {
  BVCubit(super.initialState);
}
