import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/shared/app_helper.dart';

class DealDuJour extends StatelessWidget {
  final int id;
  const DealDuJour({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.9,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image:  DecorationImage(
                      image: NetworkImage(
                        'https://picsum.photos/250?image=$id',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          height: 30,
                          width: 140,
                          decoration: BoxDecoration(
                            color: AppColors.SECONDARY,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text('Deal Du jour', textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  [
                   // SizedBox(height: 10,),
                    Padding(padding: EdgeInsets.only(left: 10, bottom: 10, top: 0),
                      child: Text(
                        'Mack Book Pro 2021,  Juste 2ansMack Book Pro 2021,  Juste 2ansMack Book Pro 2021,  Juste 2ansMack Book Pro 2021,  Juste 2ansMack Book Pro 2021,  Juste 2ans',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),),
                    Padding(padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        AppHelper.priceFormat(price: '${20000*(id+10)*Random().nextInt(10)}'),
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.SECONDARY,
                          fontWeight: FontWeight.bold,
                        ),
                      ),),
                    ElevatedButton(

                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all( AppColors.SECONDARY),
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: (){
                        print('Deal du jours');
                      },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width*0.90,
                          child: Center(
                            child: Text('Profitez-en !', style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            ),
                          ),
                        ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
