import 'package:digital_currency/network/apiProvier.dart';
import 'package:digital_currency/repository/criptodatarepository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/CryptoModel/AllCryptoModel.dart';
import '../network/responseModel.dart';

class CryptoDataProvider extends ChangeNotifier {
  ApiProvider apiProvider = ApiProvider();
  late AllCryptoModel dataFuture;
  late ResponseModel state;
  var response;
  CryptoDataRepository repository =CryptoDataRepository();


  getTopMarketCapData() async {
    state = ResponseModel.loading("is Loading...");
    try{
      response = await apiProvider.getTopMarketCapData();
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
  getTopGainerData() async {
    state = ResponseModel.loading("is Loading...");
    try{
        dataFuture = await repository.getTopGainerData();
        state = ResponseModel.completed(dataFuture);
        notifyListeners();



      notifyListeners();
    } catch (e) {

      state=ResponseModel.error("please check your data :"+e.toString());
      notifyListeners();


    }
  }
  getTopLosersData() async {
    state = ResponseModel.loading("is Loading...");
    try{
      response = await apiProvider.getTopLosersData();
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
