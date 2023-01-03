import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uas_1972025/entities/detail/detail.dart';
import 'package:uas_1972025/entities/movie/movies.dart';
import 'package:uas_1972025/widget/poster.dart';

import '../services/movie_services.dart';

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
  MovieServices services = MovieServices();
  List<Detail>? movies;
  MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: services.getPopularMovies(),
        builder: ((context, snapshot) => Scaffold(
              appBar: AppBar(
                  backgroundColor: Colors.orange,
                  leading: IconButton(
                      onPressed: () async {
                        if (FirebaseAuth.instance.currentUser == null) {
                          context.goNamed('login');
                        } else {
                          await FirebaseAuth.instance.signOut();
                        }
                      },
                      icon: const Icon(Icons.arrow_back)),
                  title: const Text('Ticket Bioskop Suzuki')),
              body: Column(
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Center(
                    child: SizedBox(
                      height: 250,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) => Poster(
                              link: services.posterImage(
                                snapshot.data!.when(
                                    success: ((value) =>
                                        value![index].poster_path),
                                    failed: ((message) => "0")),
                              ),
                              id: snapshot.hasData
                                  ? snapshot.data!.when(
                                      success: ((value) => value![index].id),
                                      failed: ((message) => 0))
                                  : 0)),
                          itemCount: snapshot.hasData
                              ? snapshot.data!.when(
                                  success: ((value) => value!.length),
                                  failed: ((message) => 0))
                              : 0),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.payment),
                    label: 'payment',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle),
                    label: 'account',
                  ),
                ],
              ),
            )));
  }
}
