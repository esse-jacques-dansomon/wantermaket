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
                children: const [
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
                icon: const Icon(Icons.close),

              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.8,
            padding: const EdgeInsets.symmetric(horizontal: 15),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 const Text('Filter Par Prix', style:  TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),),
                //rangeSlider
                SizedBox(
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
                const Text('Locatisation', style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),),
                SizedBox(
                  height: 20,
                  child: DropdownButton(
                    hint: const Text('Localisation'),
                    value: 'Dakar',
                    items: const [
                      DropdownMenuItem(
                        value: 'Dakar',
                        child: Text('Dakar'),
                      ),
                      DropdownMenuItem(
                        value: 'Thies',
                        child: Text('Thies'),
                      ),
                      DropdownMenuItem(
                        value: 'kaolack',
                        child: Text('kaolack'),
                      ),
                    ], onChanged: (String? value) {  },
                  ),
                ),

                //ChexBox Item
                const Text('Categories', style: TextStyle(
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
