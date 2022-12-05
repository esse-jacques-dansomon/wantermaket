
import 'package:flutter/cupertino.dart';
import 'package:wantermarket/shared/api_checker.dart';

import '../data/models/body/signaler_model.dart';
import '../data/repositories/signal_repo.dart';
import '../shared/app_helper.dart';

enum SignalerStatus { initial, loading, loaded, error }
class SignalerProvider extends ChangeNotifier {
  final SignalRepo signalRepo;
  SignalerProvider({required this.signalRepo});

  List<SignalerModel> _raisonsProduits = [];
  List<SignalerModel> _raisonsVendeurs = [];
  SignalerStatus _status = SignalerStatus.initial;

  List<SignalerModel> get raisonsProduits => _raisonsProduits;
  List<SignalerModel> get raisonsVendeurs => _raisonsVendeurs;
  SignalerStatus get status => _status;

  Future<void> getRaisons(BuildContext context, String type) async {
    final response = await signalRepo.raison(type: type);
    List<SignalerModel> _raisons = [];
    _raisons.add(SignalerModel(id: 0, texte: 'Sélectionner une raison'));

    if (response.response.statusCode == 200 ) {
      response.response.data.forEach((element) {
        _raisons.add(SignalerModel.fromJson(element));
      });
      print("raisons => " + response.response.data.toString());
      if(type=="produit"){
        _raisonsProduits = _raisons;
      }else{
        _raisonsVendeurs = _raisons;
      }
      notifyListeners();
    } else {
      ApiChecker.checkApi(context, response);
    }
  }

  Future<bool> signaler(BuildContext context, {required String id, required String type, required String raison }) async {
    this._status = SignalerStatus.loading;
    notifyListeners();
    final signalResponse = await signalRepo.signaler(id: id, type: type, raison: raison);
    if (signalResponse.response.statusCode == 200 ) {
      this._status = SignalerStatus.loaded;
      AppHelper.showInfoFlushBar(context, "Signalement effectué avec succès");
      notifyListeners();
      return true;
    } else {
      this._status = SignalerStatus.error;
      notifyListeners();
      ApiChecker.checkApi(context, signalResponse);
      return false;
    }
  }
}