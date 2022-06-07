import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                      width: 15
                  ),
                  Text('Filtres', style: TextStyle(
                    fontSize : 18,
                    color: Colors.black,),
                  ),
                ],
              ),
              IconButton(onPressed: (){
                Navigator.pop(context);
              },
                icon: Icon(Icons.close),

              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.8,
            padding: const EdgeInsets.symmetric(horizontal: 15),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Filter Par Prix', style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),),
                //rangeSlider
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: RangeSlider(
                    min: 0,
                    max: 10000000,
                    divisions: 100,
                    onChanged: (values){
                      print(values);
                    }, values: const RangeValues(0, 10000000),
                  ),
                ),

                //Localisation
                Text('Locatisation', style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),),
                Container(
                  height: 20,
                  child: DropdownButton(
                    hint: const Text('Localisation'),
                    value: 'Dakar',
                    items: const [
                      DropdownMenuItem(
                        child: Text('Dakar'),
                        value: 'Dakar',
                      ),
                      DropdownMenuItem(
                        child: Text('Thies'),
                        value: 'Thies',
                      ),
                      DropdownMenuItem(
                        child: Text('kaolack'),
                        value: 'kaolack',
                      ),
                    ], onChanged: (String? value) {  },
                  ),
                ),

                //ChexBox Item
                Text('Categories', style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),),





              ],
            ),
          ),
        ],
      ),
    );
  }
}
