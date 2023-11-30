import 'package:base_project/domain/repository/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/config.dart';

final userRepositoryProvider =
    Provider<UserController>((ref) => UserController());

class UserController implements UserRepository {
  final apiClient = DioClient.instance;

  @override
  Future<BaseResponse> fecthUser() {
    throw UnimplementedError();
  }
}
