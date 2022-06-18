import 'package:injectable/injectable.dart';

import 'core/http_client.dart';
import 'core/i_http_client.dart';

@singleton
class ApiProvider {
  late final BaseHttpClient _httpClient = MHttpClient();
}

// extension GettingStarted on ApiProvider {
//   Future<String?> signUp({
//     required UserModel user,
//   }) async {
//     final response = await _httpClient.post(
//       query: '/auth/registration',
//       data: {
//         "email": user.email,
//         "password": user.password,
//         "role": user.role.toString()
//       },
//     );
//     return response!['token'];
//   }
