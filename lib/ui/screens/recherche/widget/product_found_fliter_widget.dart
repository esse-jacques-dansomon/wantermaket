import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:provider/provider.dart';

import '../../../../config/app_colors.dart';
import '../../../../data/models/body/filter_model.dart';
import '../../../../providers/category_provider.dart';
import '../../../../providers/search_provider.dart';

class ProductFoundFilter extends StatefulWidget {
  const ProductFoundFilter({Key? key}) : super(key: key);

  @override
  State<ProductFoundFilter> createState() => _ProductFoundFilterState();
}

class _ProductFoundFilterState extends State<ProductFoundFilter> {

  List<dynamic> _selectedItems = [];
  int? groupValue;
  int? priceFilter;
  int min = 0;
  int max = 0;
  int isPromo = 0;
  int isPopular  = 0;
  int isNew = 0;
  @override
  Widget build(BuildContext context) {

    const List<String> selectionsPrice = <String>[
      'Prix le plus bas',
      'Prix le plus élévé',
    ];

    const List<Map<String, int>> selectionsPriceValue = [
      {'Prix le plus élévé': 1},
      {'Prix le plus bas': 0},
    ];

    var categories = Provider.of<CategoryProvider>(context, listen: false).categories;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Expanded(child: Container(
            margin: const EdgeInsets.only(right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: const Text('Annuler', style:TextStyle(
                    fontSize: 20,color: AppColors.BLACK
                ))),
                const Text('Filtres', style:TextStyle(
                  fontSize: 20, color: AppColors.BLACK
                )),
                TextButton(onPressed: (){

                  Provider.of<SearchProvider>(context, listen: false).filter(filterModel: FilterModel(
                      min: min,
                      max: max,
                      secteurs: _selectedItems ,
                      priceFilter: priceFilter,
                      isNew: isNew,
                      isPopular: isPopular,
                      isPromo: isPromo,
                      keyWorld: '',
                  ));
                  Navigator.pop(context);
                }, child: const Text('Rechercher', style:TextStyle(
                  fontSize: 20, color: AppColors.BLACK,
                )))
                ,

              ],
            ),
          ))
        ],
      ),
      body:  SingleChildScrollView(
        child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0, ),
              child: Column(
                children: [
                  //filter by price
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(15),color: Colors.grey[200], child: const Text('Prix', textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),

                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           SizedBox(
                             width: 150,
                             child: TextFormField(
                               onChanged: (value) {
                                 min = int.parse(value);
                               },
                               decoration: InputDecoration(
                                 hintText: 'min',
                                 contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                 hintStyle: const TextStyle(fontSize: 16),

                                 border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(0),
                                 ),
                               ),
                             ),
                           ),
                           SizedBox(
                             width: 150,
                             child: TextFormField(
                               onChanged: (value) {
                                 max = int.parse(value);
                               },
                               decoration: InputDecoration(
                                 hintText: 'max',
                                 contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                 hintStyle: const TextStyle(fontSize: 16),
                                 border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(0),
                                 ),
                               ),
                             ),
                           )
                         ],
                        ),
                      ),

                    ],
                  ),
                 //by attribute
                  const Divider(
                    color: Colors.grey,
                    height: 1,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(15),color: Colors.grey[200], child: const Text('Trier par', textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                      ),
                      SizedBox(

                        child: Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 15),
                          child: ListView (
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children : [
                              CheckboxListTile(
                                title: const Text("En Promotion"),
                                value: isPromo == 1,
                                onChanged: (newValue) {
                                  setState(() {
                                    isPromo = newValue! ? 1 : 0;
                                  });
                                },
                                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                              ),
                              CheckboxListTile(
                                title: const Text("Populaire"),
                                value: isPopular  == 1,
                                onChanged: (newValue) {
                                  setState(() {
                                    isPopular  = newValue! ? 1 : 0;
                                  });
                                },
                                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                              ),
                              CheckboxListTile(
                                title: const Text("Nouveautés"),
                                value: isNew == 1,
                                onChanged: (newValue) {
                                  setState(() {
                                    isNew = newValue! ? 1 : 0;
                                  });
                                },
                                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                              ),
                              const  SizedBox(height: 5,),

                            ]
                          ),
                        ),
                      ),

                    ],
                  ),
                  //par prix au plus ou au moins
                  const Divider(
                    color: Colors.grey,
                    height: 1,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(15),color: Colors.grey[200], child: const Text('Trier par prix', textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                      ),
                      SizedBox(
                        height: (60 * selectionsPrice.length).toDouble(),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 15),
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return RadioListTile<int>(
                                value: index,
                                groupValue: priceFilter,
                                toggleable: true,
                                title: Text(selectionsPrice[index]),
                                onChanged: (int? value) {
                                  setState(() {
                                    priceFilter = value;
                                  });
                                },
                              );
                            },
                            itemCount: selectionsPrice.length,
                          ),
                        ),
                      ),

                    ],
                  ),

                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(15),color: Colors.grey[200], child: Text('Secteurs', textAlign: TextAlign.start, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                  ),
                  Container(
                    // color: Colors.grey[200],
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MultiSelectDialogField(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        // color: Colors.grey[200],
                      ),
                      cancelText: const Text('annuler'),
                      confirmText: const Text('choisir'),
                      searchable: true,
                      items: categories.map((e) => MultiSelectItem(e.id, e.name!)).toList(),
                      listType: MultiSelectListType.CHIP,
                      buttonText:  const Text('Veuillez Choisir une ou plusieurs', textAlign: TextAlign.start, style: TextStyle(fontSize: 16),),
                      onConfirm: (values) {
                        _selectedItems = values;
                      },
                    ),
                  ),
                  const SizedBox(height: 10,),
                  //LOCALISATION


                ],
              ),
            ),
          ),
      ),
      );


  }
}
