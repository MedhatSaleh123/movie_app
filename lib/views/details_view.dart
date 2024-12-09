// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/api_services.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key, required this.movie});
  final Movie movie;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
   late Future<List<Movie>> related; 
   @override
   void initState() {
      related = APIservices().getUpComing();
     super.initState();
     
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderImage(movie:widget.movie,),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              )),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          widget.movie.orginalTitle,
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_horiz,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${ widget.movie.voteAverage}IBDb',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffDCE3FF),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                          ),
                          onPressed: () {},
                          child: Text('Action')),
                      SizedBox(width: 20),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffDCE3FF),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                          ),
                          onPressed: () {},
                          child: Text('Action')),
                      SizedBox(width: 20),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffDCE3FF),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                          ),
                          onPressed: () {},
                          child: Text('Action')),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        TwoItem(item1: 'Release Date', item2: "${widget.movie.release}"),
                        TwoItem(item1: 'Language', item2: "${widget.movie.originalLanguage}"=="en"?"English":"Arabic"),
                        TwoItem(item1: 'Count', item2: '${widget.movie.voteCount}')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(widget.movie.overview,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      height: 2,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Related',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {},
                          child: Text(
                            'See more',
                            style: TextStyle(color: Colors.grey),
                          ))
                    ],
                  ),
                  SizedBox(height: 20,),
                    Container(
                     
                height: 180,
                child: FutureBuilder(
                  future: related,
                  builder: (context, snapshot) {
                   
                   if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final movies = snapshot.data!;
                    return ListView.builder(
                      itemCount: movies.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GestureDetector( 
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                return DetailsView(movie: movie,);
                              },));
                            },
                            child: Container(
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.withOpacity(0.2),
                                              offset: Offset(3, 10),
                                              blurRadius: 10,
                                              spreadRadius: 3)
                                        ],
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:NetworkImage(
                                          "https://image.tmdb.org/t/p/original/${movie.backDropPath}"
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: 80,
                                    child: Text(
                                          movie.title,
                                          maxLines: 1, 
                                      style: TextStyle(
                                          fontSize: 20, fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                ),
              ),
         
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TwoItem extends StatelessWidget {
  const TwoItem({
    super.key,
    required this.item1,
    required this.item2,
  });
  final String item1;
  final String item2;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item1,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          Text(
            item2,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class HeaderImage extends StatelessWidget {
  const HeaderImage({
    super.key, required this.movie,
  });
final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
            width: double.infinity,
            height: 400,
            fit: BoxFit.cover,
            "https://image.tmdb.org/t/p/original/${movie.backDropPath}"),
        Positioned(
          left: 20,
          top: 50,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(size: 40, Icons.arrow_back,color: Colors.white,),
          ),
        ),
        Positioned(
          top: 50,
          right: 20,
          child: IconButton(onPressed: () {}, icon: Icon(
            color: Colors.white,
            size: 40, Icons.more_vert)),
        ),
        Positioned(
          top: 230,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.play_arrow,
                  size: 40,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Play Troller',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
        )
      ],
    );
  }
}
