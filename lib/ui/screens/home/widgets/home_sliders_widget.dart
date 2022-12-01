import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wantermarket/providers/slider_provider.dart';
import 'package:wantermarket/shared/app_helper.dart';


class HomeSliders extends StatelessWidget {
  const HomeSliders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SliderProvider>(
      builder: (context, sliderProvider, child){
         switch(sliderProvider.state){
          case SliderState.initial:
            return const SizedBox();
          case SliderState.loading :
            return  SizedBox(
              height: AppHelper.isTablet(context) ? 300 : 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: AppHelper.isTablet(context) ? 300 : 200,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                itemCount: 3,
              ),
            );
          case SliderState.loaded:
            return SizedBox(
              height:  AppHelper.isTablet(context) ? 300 : 210,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return  CachedNetworkImage(
                    imageUrl: AppHelper.isTablet(context) ?
                    sliderProvider.sliders[index].backgroundPath! : sliderProvider.sliders[index].backgroundPathMobile!,
                    placeholder: (context, url) =>  Shimmer.fromColors(baseColor: Colors.grey.shade100, highlightColor: Colors.grey.shade100, child: const SizedBox(height: 300,)),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    imageBuilder: (context, imageProvider) => Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        image: DecorationImage(
                            image: imageProvider,  fit: BoxFit.cover),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.8),
                              Colors.black.withOpacity(0.0),
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                              child: Text(
                                sliderProvider.sliders[index].title ?? "",
                                style:  TextStyle(
                                    color: Colors.white,
                                    fontSize: AppHelper.isTablet(context) ? 20 : 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                sliderProvider.sliders[index].subTitle ?? "",
                                style:  TextStyle(
                                    color: Colors.white,
                                    fontSize:  AppHelper.isTablet(context)? 16 : 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            //button
                          ],
                        ),
                      ),

                    ),
                  );
                },
                indicatorLayout: PageIndicatorLayout.COLOR,
                autoplay: true,
                duration: 1000,
                itemCount: sliderProvider.sliders.length,
                pagination: const SwiperPagination(),

              ),
            );
          case SliderState.error:
            return const SizedBox(
              height: 200,
              child: Center(
                child: Text('Error'),
              ),
            );
        }
      },
    );
  }
}

