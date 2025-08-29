import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Carousel extends StatefulWidget {
  // final List urlImages;
  // Carousel({required this.urlImages});
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    print("height=$height");
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection('image').get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData && snapshot.data!.docs.length > 0) {
              List urlImages = snapshot.data!.docs;
              return  Container(
                // height: 30,
                // width: 100,
                margin: EdgeInsets.only(right: 20, left: 20),
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CarouselSlider.builder(
                        options: CarouselOptions(
                            height: height / 4,
                            aspectRatio: 16 / 4,
                            viewportFraction: 0.9,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                            onPageChanged: (index, reason) {
                              setState(() {
                                activeIndex = index;
                              });
                            }),
                        itemCount: urlImages.length,
                        itemBuilder: (context, index, realIndex) {
                          final urlImage = urlImages[index]['image'];
                          return buildImage(urlImage, index);
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      buildIndicator(urlImages),
                    ],
                  ),
                
              ));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.data!.docs.isEmpty) {
              return Container(
                margin: EdgeInsets.only(right: 20, left: 20),
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
              );
            } else {
              return const Text('خطأ الرجاء المحاولة لاحقاً');
            }
          }),
    );

    // Center(
    //   child: Container(

    //     margin: EdgeInsets.only(right: 20,left: 20),
    //     padding:EdgeInsets.only(top: 20),
    //     decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(30),
    //     ),

    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         CarouselSlider.builder(

    //           options: CarouselOptions(
    //             height: 100,
    //             autoPlay: true,
    //           enlargeCenterPage: true,
    //           enlargeStrategy: CenterPageEnlargeStrategy.height,
    //           onPageChanged: (index,reason){
    //             setState(() {
    //               activeIndex=index;
    //             });
    //           }),
    //            itemCount:widget .urlImages.length,
    //           itemBuilder: (context, index, realIndex) {
    //             final urlImage = widget .urlImages[index];
    //             return buildImage(urlImage, index);
    //           },
    //         ),
    //         const SizedBox(height: 5,),
    //         buildIndicator(),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget buildImage(String urlImage, int index) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              image: NetworkImage(
                urlImage,
              ),
              fit: BoxFit.fill)),
      margin: EdgeInsets.symmetric(horizontal: 12),
      // child: Image.network(
      //   urlImage,
      //   width: double.infinity,
      //   height: height / 4,
      //   fit: BoxFit.cover,
      // ),
    );
  }

  Widget buildIndicator(List image) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: image.length,
      effect: JumpingDotEffect(
          dotWidth: 10,
          dotHeight: 10,
          activeDotColor: Colors.orange,
          dotColor: Colors.black),
    );
  }
}
