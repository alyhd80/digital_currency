
import '../models/CryptoModel/AllCryptoModel.dart';
import '../network/apiProvier.dart';

class CryptoDataRepository {
  var response;
  late AllCryptoModel dataFuture;

  ApiProvider apiProvider = ApiProvider();

  Future<AllCryptoModel> getTopGainerData() async {
    response = await apiProvider.getTopGainerData();
    dataFuture = AllCryptoModel.fromJson(response.data);
    return dataFuture;
  }
}
