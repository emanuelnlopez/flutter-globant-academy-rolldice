import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rolldice/bloc_logic/news_events.dart';
import 'package:rolldice/bloc_logic/news_state.dart';
import 'package:rolldice/bloc_logic/newsbloc.dart';
import 'package:rolldice/main.dart';
import 'package:rolldice/model/news_model.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => NewsBloc(service: ref.read(newsApiService))..add(LoaderEvent()),
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              switch (state) {
                case LoadingState _:
                  return const Center(child: CircularProgressIndicator());
                case SuccessState _:
                  List<NewsModel> list = state.props.first as List<NewsModel>;

                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      NewsModel model = list[index];

                      return Column(
                        children: [
                          Image.network(model.image ?? ""),
                          ListTile(
                            title: Text(model.title ?? ""),
                            subtitle: Text(model.description ?? ""),
                          ),
                        ],
                      );
                    },
                  );
                case ErrorState _:
                  return Center(child: Text("Some error."));
                default:
                  return const Center();
              }
            },
          ),
        ),
      ),
    );
  }
}
