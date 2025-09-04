import 'package:Bloc/core/networks/api_services.dart';
import 'package:Bloc/states/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  final ApiServices services;

  PostCubit(this.services) : super(PostInitial());

  Future<void> fetchPosts() async {
    emit(PostLoading());
    try {
      final posts = await services.fetchPosts();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }
}
