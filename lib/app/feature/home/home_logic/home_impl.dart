import 'package:tests/app/feature/home/home_logic/home_api_service.dart';
import 'package:tests/app/services/domain/api_service.dart';

class HomeImpl extends HomeApiService {

  @override
  Future getAllResturentService(String url, Map<String, dynamic> params) async {
    dynamic response = await ApiService().get(url, params: params);
    return response;
  }

}