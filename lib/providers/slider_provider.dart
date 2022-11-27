import 'package:flutter/cupertino.dart';
import 'package:wantermarket/data/repositories/slider_repo.dart';
import 'package:wantermarket/shared/api_checker.dart';

import '../data/models/body/slider.dart';

enum SliderState { initial, loading, loaded, error }

class SliderProvider extends ChangeNotifier{
  final SliderRepo sliderRepo;
  SliderProvider({required this.sliderRepo});

  final List<SliderItem> _sliders = [];
  List<SliderItem> get sliders  => _sliders;

  SliderState state = SliderState.initial;


  Future<void> getHomeSliders(BuildContext context) async {
    this.state = SliderState.loading;
    notifyListeners();
    final sliderResponse = await sliderRepo.getSliders();
    if(sliderResponse.response.statusCode==200){
      _sliders.clear();
      sliderResponse.response.data.forEach((element) {
        _sliders.add(SliderItem.fromJson(element));
      });
      this.state = SliderState.loaded;
      notifyListeners();
    }else{
      this.state = SliderState.error;
      notifyListeners();
      ApiChecker.checkApi( context, sliderResponse);
    }
  }


}