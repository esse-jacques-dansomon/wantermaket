import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/data/models/body/filter_model.dart';
import 'package:wantermarket/providers/search_provider.dart';

import '../../../../config/app_colors.dart';

class TitleAndMoreText extends StatelessWidget {
  final String moreText;
  final String title;
  final String route;
  final bool  isLoadMore =true;
  final FilterModel? filterModel;
  const TitleAndMoreText({
    Key? key, this.filterModel, required this.route, required this.moreText, required this.title, bool? isLoadMore = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 25,right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, ), textAlign: TextAlign.start,),
          isLoadMore ?
          TextButton(onPressed: (){
            if(filterModel != null) {
              Provider.of<SearchProvider>(context, listen: false).filter( filterModel: filterModel!);
            }
            Navigator.pushNamed(context, route);

          }, child: Row(
            children: const [
              Text('Voir Plus', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.FACEBOOK  ), textAlign: TextAlign.start,),
              SizedBox(width: 5,),
              Icon(Icons.arrow_forward_ios, size: 13,  color: AppColors.FACEBOOK,),
            ],
          ),
          ) : Container(),
        ],
      ),
    );
  }
}
