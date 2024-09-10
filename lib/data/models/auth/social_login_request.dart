import 'package:equatable/equatable.dart';

class SocialLoginRequest extends Equatable {
  final String email;
  final String name;

  const SocialLoginRequest({
    required this.email,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "name": name,
    };
  }

  @override
  List<Object?> get props => [email, name];
}
