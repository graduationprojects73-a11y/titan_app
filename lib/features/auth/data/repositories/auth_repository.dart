import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:titan/core/constants/api_constants.dart';
import 'package:titan/core/network/dio_provider.dart';
import 'package:titan/core/services/token_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:titan/features/auth/data/models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return AuthRepository(dio);
}

class AuthRepository {
  final Dio _dio;

  AuthRepository(this._dio);

  /// Login with email and password
  Future<LoginResponse> login({
    required String email,
    required String password,
    String? fcmToken,
    String? platform,
    String deviceName = 'hassan',
  }) async {
    try {
      // Detection of platform if not provided
      final effectivePlatform =
          platform ?? (Platform.isIOS ? 'ios' : 'android');

      // Get FCM token if not provided
      final effectiveFcmToken =
          fcmToken ?? await FirebaseMessaging.instance.getToken();

      final response = await _dio.post(
        ApiConstants.login,
        data: {
          'email': email,
          'password': password,
          'fcm_token': effectiveFcmToken ?? 'no_token',
          'platform': effectivePlatform,
          'device_name': deviceName,
        },
      );

      final loginResponse = LoginResponse.fromJson(response.data);

      // Save token and user data
      await TokenService.saveToken(loginResponse.token);
      await TokenService.saveUserData(jsonEncode(loginResponse.user.toJson()));

      return loginResponse;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Invalid email or password');
      }
      if (e.response?.data != null && e.response?.data['message'] != null) {
        throw Exception(e.response?.data['message']);
      }
      throw Exception('Login failed. Please check your connection.');
    }
  }

  /// Logout
  Future<void> logout() async {
    try {
      await _dio.post(ApiConstants.logout);
    } catch (_) {
      // Even if API fails, clear local token
    }
    clearProfileCache();
    await TokenService.deleteToken();
  }

  UserModel? _cachedProfile;

  /// Get user profile
  Future<UserModel> getProfile({bool forceRefresh = false}) async {
    if (!forceRefresh && _cachedProfile != null) {
      return _cachedProfile!;
    }
    try {
      final response = await _dio.get(ApiConstants.profile);
      final data = response.data['data'] as Map<String, dynamic>;
      final user = UserModel.fromJson(data['user'] as Map<String, dynamic>);
      _cachedProfile = user;
      return _cachedProfile!;
    } catch (e) {
      throw Exception('Failed to fetch profile: $e');
    }
  }

  void clearProfileCache() {
    _cachedProfile = null;
  }

  /// Forgot password
  Future<String> forgotPassword({required String email}) async {
    try {
      final response = await _dio.post(
        ApiConstants.forgotPassword,
        data: {'email': email},
      );
      return response.data['message'] as String? ?? 'Check your email';
    } catch (e) {
      throw Exception('Failed to send reset email');
    }
  }

  /// Register
  Future<LoginResponse> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.register,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );

      final loginResponse = LoginResponse.fromJson(response.data);

      // Save token and user data
      await TokenService.saveToken(loginResponse.token);
      await TokenService.saveUserData(jsonEncode(loginResponse.user.toJson()));

      return loginResponse;
    } on DioException catch (e) {
      if (e.response?.data != null && e.response?.data['message'] != null) {
        throw Exception(e.response?.data['message']);
      }
      throw Exception('Registration failed');
    }
  }
}
