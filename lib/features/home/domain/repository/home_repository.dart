part of 'ihome_repository.dart';

@Injectable(as: IHomeRepository)
class HomeRepository extends IHomeRepository {
  final IHomeRemoteSource remoteDataSource;

  HomeRepository(this.remoteDataSource);
}
