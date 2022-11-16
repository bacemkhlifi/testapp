
import 'package:http/http.dart' as http;

import 'package:riverpod/riverpod.dart';

import '../Presentation/Infrastructure/Model/user_model.dart';
import '../Presentation/Infrastructure/user_repository.dart';

final userProvider = Provider((ref) => UserRepository(http.Client()));

final userFutureProvider =
    FutureProvider.autoDispose.family<List<User>, String>((ref, url) async {
  final httpClient = ref.read(userProvider);
  return httpClient.getUser(url);
});
