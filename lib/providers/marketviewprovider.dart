

import 'package:flutter/cupertino.dart';

import '../models/CryptoModel/AllCryptoModel.dart';
import '../network/apiProvier.dart';
import '../network/responseModel.dart';


class MarketViewProvider extends ChangeNotifier{
  ApiProvider apiProvider = ApiProvider();
  late AllCryptoModel dataFuture;
  late ResponseModel state;
  var response;




  getAllCryptoData() async {
    state = ResponseModel.loading("is Loading...");
    try{
      response = await apiProvider.getAllCryptoData();
      if(response.statusCode == 200){
        dataFuture = AllCryptoModel.fromJson(response.data);
        state = ResponseModel.completed(dataFuture);
      } else {
        state=ResponseModel.error("somthing is wrong ....");
        notifyListeners();
      }


      notifyListeners();
    } catch (e) {

      state=ResponseModel.error("please check your data :"+e.toString());
      notifyListeners();


    }
  }



}