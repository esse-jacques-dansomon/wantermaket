import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

final images=[
  'assets/images/agroalimentaire.png',
  'assets/images/logo.png',
];

class HomeSliders extends StatelessWidget {
  const HomeSliders({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return  Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              image: DecorationImage(
                  image:  Image.network('https://picsum.photos/250?image=${index*11}',).image,  fit: BoxFit.cover),
            ),

          );
        },
        indicatorLayout: PageIndicatorLayout.COLOR,
        autoplay: true,
        duration: 1000,
        itemCount: images.length,
        pagination: const SwiperPagination(),

      ),
    );
  }
}

