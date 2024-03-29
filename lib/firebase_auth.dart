import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider =Provider((ref) => FirebaseAuth.instance);
final userProvider=StreamProvider<User?>((ref){
  return ref.watch(authProvider).authStateChanges();
});