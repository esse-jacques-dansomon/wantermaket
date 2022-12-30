import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/boutique_favories_provider.dart';
import 'package:wantermarket/ui/basewidgets/cards/boutique_favorite_card.dart';

import 'package:wantermarket/ui/basewidgets/app_bars/app_bar_with_return.dart'
    show appBarWithReturn;

class BoutiquesFavoriesScreen extends StatefulWidget {
  const BoutiquesFavoriesScreen({Key? key}) : super(key: key);

  @override
  State<BoutiquesFavoriesScreen> createState() =>
      _BoutiquesFavoriesScreenState();
}

class _BoutiquesFavoriesScreenState extends State<BoutiquesFavoriesScreen> {
  _loadBoutiquesFavories() async {
    final boutiqueFavoriesProvider =
        Provider.of<BoutiqueFavoriesProvider>(context, listen: false);
    boutiqueFavoriesProvider.getAllMyFavories(context);
  }

  @override
  void initState() {
    super.initState();
    _loadBoutiquesFavories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBarWithReturn(title: 'Mes Boutiques Favories', context: context),
      body: SafeArea(
        child: Provider.of<BoutiqueFavoriesProvider>(context, listen: true)
                .boutiquesFavories
                .isNotEmpty
            ? Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 10),
                child: Consumer<BoutiqueFavoriesProvider>(
                    builder: (context, boutiqueFavoriesProvider, _) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount:
                        boutiqueFavoriesProvider.boutiquesFavories.length,
                    itemBuilder: (context, index) {
                      return BoutiqueFavorite(
                        boutique:
                            boutiqueFavoriesProvider.boutiquesFavories[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 1,
                        color: Colors.grey,
                      );
                    },
                  );
                }),
              )
            : const Center(
                child: Text('Vous n\'avez pas de boutiques favories'),
              ),
      ),
    );
  }
}
