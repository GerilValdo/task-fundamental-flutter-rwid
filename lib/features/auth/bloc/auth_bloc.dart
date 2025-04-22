import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/data/remote/firebase/auth/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthLoading()) {
    on<RegisterEvent>((event, emit) async {
      try {
        emit(AuthLoading());
        final user = await authRepository.signUp(
            event.name, event.email, event.password);
        if (user != null) {
          emit(AuthSuccess(user));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<LoginEvent>(
      (event, emit) async {
        try {
          emit(AuthLoading());
          final user = await authRepository.signIn(event.email, event.password);
          if (user != null) {
            emit(AuthSuccess(user));
          }
          // emit(AuthSuccess(null));
        } catch (e) {
          emit(AuthError(e.toString()));
        }
      },
    );

    on<GoogleSignInRequestedEvent>(
      (event, emit) async {
        try {
          emit(AuthLoading());
          final user = await authRepository.signInWithGoogle();
          if (user != null) {
            emit(AuthSuccess(user));
          }
        } catch (e) {
          emit(AuthError(e.toString()));
        }
      },
    );

    on<LogoutEvent>(
      (event, emit) async {
        try {
          emit(AuthLoading());
          await authRepository.signOut();
          emit(AuthSuccess(null));
        } catch (e) {
          emit(AuthError(e.toString()));
        }
      },
    );
  }
}
