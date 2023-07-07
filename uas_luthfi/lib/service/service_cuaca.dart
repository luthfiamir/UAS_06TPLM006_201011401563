import 'package:uas_luthfi/model/model_cuaca.dart';
import 'package:dio/dio.dart';

class ServiceCuaca {
  final dio = Dio();

  Future<ModelCuaca> getCurrentWeather(String cityName) async {
    final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=72ee8a69c1bd8ceea8802201f0e6e64c&units=metric');
    print(response.requestOptions.path);
    return ModelCuaca.fromJson(response.data);
  }
}