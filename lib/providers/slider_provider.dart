import 'package:flutter/cupertino.dart';
import 'package:wantermarket/data/repositories/slider_repo.dart';

import '../data/models/body/slider.dart';

class SliderProvider extends ChangeNotifier{
  final SliderRepo sliderRepo;
  SliderProvider({required this.sliderRepo});

  final List<SliderItem> _sliders = [];
  List<SliderItem> get sliders  => _sliders;

  Future<void> getHomeSliders() async {
    final sliderResponse = await sliderRepo.getSliders();
    if(sliderResponse.error == null){
      _sliders.clear();
      sliderResponse.response.data.forEach((element) {
        _sliders.add(SliderItem.fromJson(element));
      });
      notifyListeners();
    }
  }
}