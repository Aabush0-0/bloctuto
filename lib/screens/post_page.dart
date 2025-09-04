import 'package:Bloc/core/networks/api_services.dart';
import 'package:Bloc/states/post_cubit.dart';
import 'package:Bloc/states/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostCubit(ApiServices()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Posts with Cubit/Bloc'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 10),
                  Expanded(
                    child: BlocBuilder<PostCubit, PostState>(
                      builder: (context, state) {
                        if (state is PostLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is PostLoaded) {
                          return ListView.builder(
                            itemCount: state.posts.length,
                            itemBuilder: (context, index) {
                              final post = state.posts[index];
                              return ListTile(
                                leading: CircleAvatar(
                                  child: Text(post.id.toString()),
                                ),
                                title: Text(post.title),
                                subtitle: Text(post.body),
                              );
                            },
                          );
                        } else if (state is PostError) {
                          return Center(child: Text(state.message));
                        }
                        return const Center(
                          child: Text('Press button to load posts'),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PostCubit>().fetchPosts();
                    },
                    child: const Text("Load Posts"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
