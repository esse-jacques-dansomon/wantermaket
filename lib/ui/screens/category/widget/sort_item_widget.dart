import 'package:flutter/cupertino.dart';

import '../../../basewidgets/cards/listTitle_item.dart';

class SortItemsWidget extends StatelessWidget {
  const SortItemsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.3,
      child: Column(
        children: const [
           SizedBox(height: 10,),
           Center(
            child: Text(
              'Trier par', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
           SizedBox(height: 10,),
          ListTitleItem(
            isSelect: true,name: 'Popularite',
          ) ,
          ListTitleItem(
            isSelect: false,name: 'Prix : Moins au Plus',
          ) ,
          ListTitleItem(
            isSelect: false,name: 'Prix : Moins au Plus',
          )


        ],
      ),
    );
  }
}
