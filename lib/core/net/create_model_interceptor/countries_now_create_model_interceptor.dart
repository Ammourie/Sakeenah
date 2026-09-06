import 'create_model.interceptor.dart';

class CountriesNowCreateModelInterceptor extends CreateModelInterceptor {
  const CountriesNowCreateModelInterceptor();

  @override
  T getModel<T>(dynamic Function(dynamic) modelCreator, dynamic json) {
    return modelCreator(json['data']);
  }
}
