import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:moviesapp/ApiManager.dart';
import 'package:moviesapp/GetFromApi/GetNewRelease.dart';
import 'package:moviesapp/GetFromApi/GetPopular.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<GetNewRelease>(

        future:ApiManager.getNewRealesa(),
        builder:(context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
              ),
            );

          }else if(snapshot.hasError){
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(onPressed: (){}, child: Text('Try Again'))
              ],
            );
          }else{
            return Scaffold(

                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: Color(0xff1A1A1A),
                  selectedItemColor: Color(0xffB0A000),
                  items: [
                    BottomNavigationBarItem(icon: Icon(Icons.home,), label: 'HOME'),
                    BottomNavigationBarItem(icon: Icon(Icons.search,color: Colors.grey), label: 'SEARCH'),
                    BottomNavigationBarItem(icon: Icon(Icons.movie,color: Colors.grey), label: 'HOME'),
                    // BottomNavigationBarItem(
                    //   icon: Icon(Icons.save),
                    //   label: 'HOME'
                    // ),
                  ],
                ),
                backgroundColor: Color(0xff121312),
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ///background image
                      Stack(
                        children: [
                          ImageSlideshow(children: [
                            Image.asset(
                              'assets/images/R.jpeg',
                              // result[index]?.posterPath??'',
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width * 1,
                              fit: BoxFit.fill,
                            ),
                          ]),
                          Row(
                            children: [
                              ///photo over background
                              Container(
                                  margin: EdgeInsets.only(left: 16, top: 140),
                                  child: Image.asset(
                                    'assets/images/R.jpeg',
                                    height: MediaQuery.of(context).size.height * 0.2,
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    fit: BoxFit.fill,
                                  )),

                              ///text Container
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 12, top: 240),
                                    child: Text(
                                      'THE EXPENDABLES',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0, left: 13),
                                    child: Text(
                                      '2019  PG-13  2h 7m',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),

                      ///new release container
                      // Container(
                      //   margin: EdgeInsets.only(top: 20),
                      //   padding: EdgeInsets.only(left: 16),
                      //   decoration: BoxDecoration(color: Color(0xff282A28)),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.stretch,
                      //
                      //
                      //     children: [
                      //       ///(new release text)
                      //
                      //       Padding(
                      //         padding: const EdgeInsets.only(top: 8.0),
                      //         child: Text(
                      //           'New Releases',
                      //           style: TextStyle(color: Colors.white, fontSize: 20),
                      //         ),
                      //       ),
                      //
                      //       ///movies scroll
                      //       ListView.builder(itemBuilder: (context, index) {
                      //           return Expanded(
                      //             child: Container(
                      //               padding: EdgeInsets.only(top: 8),
                      //               clipBehavior: Clip.antiAlias,
                      //               decoration: BoxDecoration(
                      //                   borderRadius: BorderRadius.circular(20)),
                      //               child: Image.asset(
                      //                 'assets/images/R.jpeg',
                      //                 height: MediaQuery.of(context).size.height * 0.2,
                      //                 width: MediaQuery.of(context).size.width * 0.25,
                      //               ),
                      //             ),
                      //           );
                      //         },
                      //         itemCount: 7,
                      //           scrollDirection: Axis.horizontal,
                      //         ),
                      //       // SingleChildScrollView(
                      //       //   scrollDirection: Axis.horizontal,
                      //       //   child: Container(
                      //       //           padding: EdgeInsets.only(top: 8),
                      //       //           clipBehavior: Clip.antiAlias,
                      //       //           decoration: BoxDecoration(
                      //       //               borderRadius: BorderRadius.circular(20)),
                      //       //           child: Image.asset(
                      //       //             'assets/images/R.jpeg',
                      //       //             height: MediaQuery.of(context).size.height * 0.2,
                      //       //             width: MediaQuery.of(context).size.width * 0.25,
                      //       //           ),
                      //       //         ),
                      //       // )
                      //
                      //     ],
                      //   ),
                      // ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(left: 16),
                        decoration: BoxDecoration(color: Color(0xff282A28)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // New release text
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'New Releases',
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),

                            // Movies scroll
                            Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return
                                    Padding(
                                      padding: EdgeInsets.only(right: 8, bottom: 12,top: 4),
                                      child: Container(
                                        padding: EdgeInsets.only(top: 8),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(18),
                                        ),
                                        child: Image.network(
                                          "https://image.tmdb.org/t/p/w500"+ snapshot.data!.results![index].posterPath!,
                                          height: MediaQuery.of(context).size.height * 0.2,
                                          width: MediaQuery.of(context).size.width * 0.25,
                                        ),

                                      ),
                                    );
                                },
                                itemCount: snapshot.data?.results?.length,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                          ],
                        ),
                      ),

                      ///recommended container
                      // Container(
                      //     margin: EdgeInsets.only(top: 20),
                      //     padding: EdgeInsets.only(left: 16),
                      //     decoration: BoxDecoration(color: Color(0xff282A28)),
                      //     child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.stretch,
                      //         children: [
                      //           Padding(
                      //             padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                      //             child: Text(
                      //               'Rcommended',
                      //               style: TextStyle(color: Colors.white, fontSize: 20),
                      //             ),
                      //           ),
                      //           // SingleChildScrollView(
                      //           //   scrollDirection: Axis.horizontal,
                      //           //   child: Row(
                      //           //     children: [
                      //           //       Card(
                      //           //         clipBehavior: Clip.antiAlias,
                      //           //         color: Color(0xff121312),
                      //           //         child: Column(
                      //           //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           //           children: [
                      //           //             Image.asset('assets/images/R.jpeg',
                      //           //               height: MediaQuery.of(context).size.height * 0.20,
                      //           //               width: MediaQuery.of(context).size.width * 0.32,
                      //           //               fit: BoxFit.fill,
                      //           //             ),
                      //           //             Padding(
                      //           //               padding: const EdgeInsets.only(left: 8.0,top: 8),
                      //           //               child: Row(
                      //           //                 children: [
                      //           //
                      //           //                   Icon(Icons.star,color: Colors.yellow),
                      //           //                   SizedBox(width: 8,),
                      //           //                   Text('7.5',style: TextStyle(color: Colors.white),)
                      //           //                 ],
                      //           //               ),
                      //           //             ),
                      //           //             Padding(
                      //           //               padding: const EdgeInsets.only(left: 8.0,top: 8,bottom: 8),
                      //           //               child: Text('The Expendables',style: TextStyle(
                      //           //                 color: Colors.white
                      //           //               ),),
                      //           //             ),
                      //           //
                      //           //             Padding(
                      //           //               padding: const EdgeInsets.only(left: 8.0,top: 0,bottom: 8),
                      //           //               child: Row(
                      //           //                 children: [
                      //           //                   Text('2018',style: TextStyle(
                      //           //                     color: Colors.grey,
                      //           //                     fontSize: 12
                      //           //                   ),),
                      //           //                   SizedBox(width: 8,),
                      //           //                   Text('1h 38m',style: TextStyle(
                      //           //                       color: Colors.grey,
                      //           //                       fontSize: 12
                      //           //                   ),),
                      //           //
                      //           //                 ],
                      //           //               ),
                      //           //             ),
                      //           //
                      //           //           ],
                      //           //         ),
                      //           //       ),
                      //           //       SizedBox(width: 8,),
                      //           //       Card(
                      //           //         clipBehavior: Clip.antiAlias,
                      //           //         color: Color(0xff121312),
                      //           //         child: Column(
                      //           //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           //           children: [
                      //           //             Image.asset('assets/images/R.jpeg',
                      //           //               height: MediaQuery.of(context).size.height * 0.20,
                      //           //               width: MediaQuery.of(context).size.width * 0.32,
                      //           //               fit: BoxFit.fill,
                      //           //             ),
                      //           //             Padding(
                      //           //               padding: const EdgeInsets.only(left: 8.0,top: 8),
                      //           //               child: Row(
                      //           //                 children: [
                      //           //
                      //           //                   Icon(Icons.star,color: Colors.yellow),
                      //           //                   SizedBox(width: 8,),
                      //           //                   Text('7.5',style: TextStyle(color: Colors.white),)
                      //           //                 ],
                      //           //               ),
                      //           //             ),
                      //           //             Padding(
                      //           //               padding: const EdgeInsets.only(left: 8.0,top: 8,bottom: 8),
                      //           //               child: Text('The Expendables',style: TextStyle(
                      //           //                   color: Colors.white
                      //           //               ),),
                      //           //             ),
                      //           //
                      //           //             Padding(
                      //           //               padding: const EdgeInsets.only(left: 8.0,top: 0,bottom: 8),
                      //           //               child: Row(
                      //           //                 children: [
                      //           //                   Text('2018',style: TextStyle(
                      //           //                       color: Colors.grey,
                      //           //                       fontSize: 12
                      //           //                   ),),
                      //           //                   SizedBox(width: 8,),
                      //           //                   Text('1h 38m',style: TextStyle(
                      //           //                       color: Colors.grey,
                      //           //                       fontSize: 12
                      //           //                   ),),
                      //           //
                      //           //                 ],
                      //           //               ),
                      //           //             ),
                      //           //
                      //           //           ],
                      //           //         ),
                      //           //       ),
                      //           //       SizedBox(width: 8,),
                      //           //       Card(
                      //           //         clipBehavior: Clip.antiAlias,
                      //           //         color: Color(0xff121312),
                      //           //         child: Column(
                      //           //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           //           children: [
                      //           //             Image.asset('assets/images/R.jpeg',
                      //           //               height: MediaQuery.of(context).size.height * 0.20,
                      //           //               width: MediaQuery.of(context).size.width * 0.32,
                      //           //               fit: BoxFit.fill,
                      //           //             ),
                      //           //             Padding(
                      //           //               padding: const EdgeInsets.only(left: 8.0,top: 8),
                      //           //               child: Row(
                      //           //                 children: [
                      //           //
                      //           //                   Icon(Icons.star,color: Colors.yellow),
                      //           //                   SizedBox(width: 8,),
                      //           //                   Text('7.5',style: TextStyle(color: Colors.white),)
                      //           //                 ],
                      //           //               ),
                      //           //             ),
                      //           //             Padding(
                      //           //               padding: const EdgeInsets.only(left: 8.0,top: 8,bottom: 8),
                      //           //               child: Text('The Expendables',style: TextStyle(
                      //           //                   color: Colors.white
                      //           //               ),),
                      //           //             ),
                      //           //
                      //           //             Padding(
                      //           //               padding: const EdgeInsets.only(left: 8.0,top: 0,bottom: 8),
                      //           //               child: Row(
                      //           //                 children: [
                      //           //                   Text('2018',style: TextStyle(
                      //           //                       color: Colors.grey,
                      //           //                       fontSize: 12
                      //           //                   ),),
                      //           //                   SizedBox(width: 8,),
                      //           //                   Text('1h 38m',style: TextStyle(
                      //           //                       color: Colors.grey,
                      //           //                       fontSize: 12
                      //           //                   ),),
                      //           //
                      //           //                 ],
                      //           //               ),
                      //           //             ),
                      //           //
                      //           //           ],
                      //           //         ),
                      //           //       ),
                      //           //       SizedBox(width: 8,),
                      //           //       Card(
                      //           //         clipBehavior: Clip.antiAlias,
                      //           //         color: Color(0xff121312),
                      //           //         child: Column(
                      //           //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           //           children: [
                      //           //             Image.asset('assets/images/R.jpeg',
                      //           //               height: MediaQuery.of(context).size.height * 0.20,
                      //           //               width: MediaQuery.of(context).size.width * 0.32,
                      //           //               fit: BoxFit.fill,
                      //           //             ),
                      //           //             Padding(
                      //           //               padding: const EdgeInsets.only(left: 8.0,top: 8),
                      //           //               child: Row(
                      //           //                 children: [
                      //           //
                      //           //                   Icon(Icons.star,color: Colors.yellow),
                      //           //                   SizedBox(width: 8,),
                      //           //                   Text('7.5',style: TextStyle(color: Colors.white),)
                      //           //                 ],
                      //           //               ),
                      //           //             ),
                      //           //             Padding(
                      //           //               padding: const EdgeInsets.only(left: 8.0,top: 8,bottom: 8),
                      //           //               child: Text('The Expendables',style: TextStyle(
                      //           //                   color: Colors.white
                      //           //               ),),
                      //           //             ),
                      //           //
                      //           //             Padding(
                      //           //               padding: const EdgeInsets.only(left: 8.0,top: 0,bottom: 8),
                      //           //               child: Row(
                      //           //                 children: [
                      //           //                   Text('2018',style: TextStyle(
                      //           //                       color: Colors.grey,
                      //           //                       fontSize: 12
                      //           //                   ),),
                      //           //                   SizedBox(width: 8,),
                      //           //                   Text('1h 38m',style: TextStyle(
                      //           //                       color: Colors.grey,
                      //           //                       fontSize: 12
                      //           //                   ),),
                      //           //
                      //           //                 ],
                      //           //               ),
                      //           //             ),
                      //           //
                      //           //           ],
                      //           //         ),
                      //           //       ),
                      //           //     ],
                      //           //   ),
                      //           // )
                      //           ListView.builder(itemBuilder: (context, index) {
                      //             return Card(
                      //               clipBehavior: Clip.antiAlias,
                      //               color: Color(0xff121312),
                      //               child: Column(
                      //                 crossAxisAlignment: CrossAxisAlignment.start,
                      //                 children: [
                      //                   Image.asset('assets/images/R.jpeg',
                      //                     height: MediaQuery.of(context).size.height * 0.20,
                      //                     width: MediaQuery.of(context).size.width * 0.32,
                      //                     fit: BoxFit.fill,
                      //                   ),
                      //                   Padding(
                      //                     padding: const EdgeInsets.only(left: 8.0,top: 8),
                      //                     child: Row(
                      //                       children: [
                      //
                      //                         Icon(Icons.star,color: Colors.yellow),
                      //                         SizedBox(width: 8,),
                      //                         Text('7.5',style: TextStyle(color: Colors.white),)
                      //                       ],
                      //                     ),
                      //                   ),
                      //                   Padding(
                      //                     padding: const EdgeInsets.only(left: 8.0,top: 8,bottom: 8),
                      //                     child: Text('The Expendables',style: TextStyle(
                      //                         color: Colors.white
                      //                     ),),
                      //                   ),
                      //
                      //                   Padding(
                      //                     padding: const EdgeInsets.only(left: 8.0,top: 0,bottom: 8),
                      //                     child: Row(
                      //                       children: [
                      //                         Text('2018',style: TextStyle(
                      //                             color: Colors.grey,
                      //                             fontSize: 12
                      //                         ),),
                      //                         SizedBox(width: 8,),
                      //                         Text('1h 38m',style: TextStyle(
                      //                             color: Colors.grey,
                      //                             fontSize: 12
                      //                         ),),
                      //
                      //                       ],
                      //                     ),
                      //                   ),
                      //
                      //                 ],
                      //               ),
                      //             );
                      //           },
                      //           itemCount: 8,
                      //             scrollDirection: Axis.horizontal,
                      //           )
                      //
                      //         ]))
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(left: 16),
                        decoration: BoxDecoration(color: Color(0xff282A28)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // New release text
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Recommended',
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.35,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8,top: 8),
                                    child: Card(
                                      clipBehavior: Clip.antiAlias,
                                      color: Color(0xff121312),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/R.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.20,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.fill,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0, top: 8),
                                            child: Row(
                                              children: [
                                                Icon(Icons.star, color: Colors.yellow),
                                                SizedBox(width: 8),
                                                Text(
                                                  '7.5',
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                              top: 8,
                                              bottom: 8,
                                            ),
                                            child: Text(
                                              'The Expendables',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                              top: 0,
                                              bottom: 8,
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  '2018',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                SizedBox(width: 8),
                                                Text(
                                                  '1h 38m',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: 8,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
            );
          }


        },
    );


  }
}
