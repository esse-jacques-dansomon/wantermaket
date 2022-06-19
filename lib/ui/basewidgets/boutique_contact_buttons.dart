import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../../config/app_dimenssions.dart';

class BoutiqueContactButtons extends StatelessWidget {
  const BoutiqueContactButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 25, width: double.infinity, child: ElevatedButton(
        onPressed: (){
          //show dialog
          showDialog(

            context: context,
            builder: (context) => AlertDialog(
              title: Text('Contactez le vendeur via: ', textAlign: TextAlign.start, ),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 35,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black54),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),)
                        ),
                        onPressed: (){}, child: Row(
                      children: [
                        const Icon(Icons.call_outlined, size: 25),
                      ],
                    )),
                  ),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black54),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),)
                        ),
                        onPressed: (){}, child: Row(
                      children: [
                        const Icon(Icons.sms_outlined, size: 25),
                      ],
                    )),
                  ),
                  SizedBox(
                    height: 35,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),)
                        ),
                        onPressed: (){}, child: Row(
                      children: [
                        const Icon(Icons.whatsapp, size: 25),
                      ],
                    )),
                  ),
                  //message
                ],
              ),
              actions: [

              ],
            ),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.SECONDARY),
        ),
        child: Text('Contactez le vendeur', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_DEFAULT), textAlign: TextAlign.left, )))
    ;
  }
}
