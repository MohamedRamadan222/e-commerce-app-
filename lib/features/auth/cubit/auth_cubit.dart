import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/auth/cubit/auth_state.dart';
import 'package:ecommerce/features/auth/models/login_response_model.dart';
import 'package:ecommerce/features/auth/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());

  final AuthRepo _authRepo;

  void login({required String username, required String password}) async {
    emit(LoadingAuthState());

    final Either<String, LoginResponseModel> res = await _authRepo.login(
      username,
      password,
    );
    res.fold(
      (error) {
        emit(ErrorAuthState(error));
      },
      (right) {
        emit((SuccessAuthState('Login Successfully')));
      },
    );
  }
}
