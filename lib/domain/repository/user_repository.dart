import 'package:base_project/config/network/network.dart';

abstract class UserRepository {
  Future<BaseResponse> fecthUser();
}
