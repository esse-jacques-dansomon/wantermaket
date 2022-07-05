import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/slider_provider.dart';


class HomeSliders extends StatelessWidget {
  const HomeSliders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Consumer<SliderProvider>(
        builder: (context, sliderProvider, child){
          return Swiper(
            itemBuilder: (BuildContext context, int index) {
              return  Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  image: DecorationImage(
                      image:  Image.network(sliderProvider.sliders[index].backgroudPath).image,  fit: BoxFit.cover),
                ),

              );
            },
            indicatorLayout: PageIndicatorLayout.COLOR,
            autoplay: true,
            duration: 1000,
            itemCount: sliderProvider.sliders.length,
            pagination: const SwiperPagination(),

          );
        },
      ),
    );
  }
}

