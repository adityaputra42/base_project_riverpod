import 'package:base_project/domain/repository/repository.dart';

import '../../config/config.dart';

class UserController implements UserRepository {
  final apiClient = DioClient.instance;

  @override
  Future<BaseResponse> fecthUser() {
    throw UnimplementedError();
  }
}
