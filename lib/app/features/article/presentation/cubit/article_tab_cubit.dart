import 'package:bloc/bloc.dart';

class ArticleTabCubit extends Cubit<int> {
  ArticleTabCubit() : super(0);
  void setTabIndex(int index) {
    emit(index);
  }
}
