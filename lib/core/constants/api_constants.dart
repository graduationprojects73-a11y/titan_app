class ApiConstants {
  // Base URL
  static const String host = 'http://72.62.186.142:8000';
  static const String baseUrl = '$host/api';

  // Auth Endpoints
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';
  static const String profile = '/profile';
  static const String logout = '/logout';

  // Admin - User Management
  static const String addUser = '/add/user';
  static const String getUsers = '/users';
  static const String showUser = '/users'; // + /{id}
  static const String updateUser = '/users'; // + /{id}
  static const String deleteUser = '/users'; // + /{id}

  // Admin - Vehicle Management
  static const String vehicles = '/vehicles';
  static const String allVehicles = '/vehicles';
  static const String createVehicle = '/vehicles';
  static const String updateVehicle = '/vehicles'; // + /{id}
  static const String deleteVehicle = '/vehicles'; // + /{id}
  static const String authorizedVehicles = '/vehicles/authorized';
  static const String unauthorizedVehicles = '/vehicles/unauthorized';

  // Monitoring Endpoints
  static const String dashboard = '/dashboard';
  static const String ppeLogs = '/pee-log/all';
  static const String ppeLogDetails = '/pee-log'; // + /{id}
  static const String vehicleLogs = '/vehicle-log/all';
  static const String vehicleLogDetails = '/vehicle-log'; // + /{id}
  static const String reports = '/report';
  static const String newRequest = '/new-request';
  static const String fireLogs = '/fire-logs';
  static const String fireLogDetails = '/fire-logs'; // + /{id}
}
