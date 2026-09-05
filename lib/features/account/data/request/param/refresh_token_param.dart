import '../../../../../core/params/base_params.dart';

class RefreshTokenParam extends BaseParams {
  final String accessToken;
  final String refreshToken;
  RefreshTokenParam({required this.accessToken, required this.refreshToken});
  @override
  Map<String, dynamic> toMap() => {
    'accessToken': accessToken,
    'refreshToken': refreshToken,
  };
}
