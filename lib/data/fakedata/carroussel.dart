class CarouselModel {
  String image;

  CarouselModel(this.image);

}
List<Map<String, String>>  carouselsData = [
  {"image": "assets/images/carousel_flight_discount.png"},
  {"image": "assets/images/carousel_hotel_discount.png"},
  {"image": "assets/images/carousel_covid_discount.png"},
];

//convert  carouselsData to List<CarouselModel>
List<CarouselModel> carousels = [
  CarouselModel("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.thegioididong.com%2Fdien-thoai-di-dong%2Fapple-iphone-x-64gb-silver-16085&psig=AOvVaw3Z_Z_X-_X-_X-_X-_X-&ust=1589737797899000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKDyq-_X-oCFQAAAAAdAAAAABAD"),
  CarouselModel("https://www.placehold.it/200x150/EFEFEF/AAAAAA&text=I+Love+Flutter"),
  CarouselModel("https://www.placehold.it/200x150/EFEFEF/AAAAAA&text=I+Love+Jacques"),
];