import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usescases/usescase.dart';
import 'package:spotify_clone/data/model/auth/signIn_user_req.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class SignInUse implements UseCase<Either, SignInUserReq> {
  @override
  Future<Either> call({SignInUserReq? params}) {
    return sl<AuthRepository>().signIn(params!);
  }
}
