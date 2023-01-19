import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialData = 20}) : super(initialData);

  int initialData;
  int? current = 0;
  int? next = 0;

  void tambahData() {
    emit(state + 1);
  }

  void kurangData() {
    emit(state - 1);
  }

  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    super.onChange(change);
    // print(change);
    current = change.currentState;
    next = change.nextState;
  }
}