import '../../../../../core/params/base_params.dart';

class GetPokemonsParameter extends BaseParams {
  /// Request Fields
  final int limit;
  final int offset;

  GetPokemonsParameter({
    required this.limit,
    required this.offset,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      "limit": limit,
      "offset": offset,
    };
  }
}
