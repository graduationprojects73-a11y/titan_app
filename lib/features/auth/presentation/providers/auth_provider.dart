import 'dart:convert';
import 'package:titan/core/services/token_service.dart';
import 'package:titan/features/auth/data/models/user_model.dart';
import 'package:titan/features/auth/data/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

/// Provider for login
@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  Future<LoginResponse?> build() async {
    final token = await TokenService.getToken();
    final userData = await TokenService.getUserData();

    if (token != null && userData != null) {
      try {
        final user = UserModel.fromJson(jsonDecode(userData));
        return LoginResponse(
          status: 'success',
          message: 'Session restored',
          user: user,
          token: token,
        );
      } catch (e) {
        print("ERROR: Failed to restore session: $e");
        return null;
      }
    }
    return null;
  }

  Future<bool> login({required String email, required String password}) async {
    state = const AsyncValue.loading();
    try {
      final repo = ref.read(authRepositoryProvider);
      final response = await repo.login(email: email, password: password);
      print("DEBUG: API Login Success. User role: ${response.user.role}");
      state = AsyncValue.data(response);
      return true;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      return false;
    }
  }

  Future<void> logout() async {
    final repo = ref.read(authRepositoryProvider);
    await repo.logout();
    state = const AsyncValue.data(null);
  }
}

/// Provider for user profile
@riverpod
Future<UserModel> userProfile(UserProfileRef ref) async {
  final repo = ref.watch(authRepositoryProvider);
  return repo.getProfile();
}
