/// 基底ドメイン例外
/// ドメイン層が定義する例外の基底クラス
abstract class DomainException implements Exception {
  const DomainException(this.message);

  final Object message;
}

/// ドメイン層で発生する入力値検査例外
class ValidatorException extends DomainException {
  const ValidatorException._([super.message = 'validator exception']);

  /// 引数が不正
  factory ValidatorException.invalidArgument() {
    return const ValidatorException._('Invalid argument');
  }

  /// Email
  factory ValidatorException.invalidEmail() {
    return const ValidatorException._('Invalid Email');
  }

  /// Password
  factory ValidatorException.invalidPassword() {
    return const ValidatorException._('Please enter at least 6 alphanumeric characters.');
  }

  @override
  String toString() => 'ValidatorException: $message';
}

/// インフラストラクチャ層で発生するネットワーク関連の例外
///
/// リポジトリ実装がこの例外を投げたら、プレゼンテーション層
/// で受け取って適切に表示すること。
class FirebaseNetworkException extends DomainException {
  const FirebaseNetworkException([
    super.message = 'firebase exception',
    String? code,
    String? description,
  ])  : code = code ?? _codeUnknown,
        description = description ?? _descriptionUnknown;

  /// インターネット接続不可
  factory FirebaseNetworkException.noInternetConnection() => const FirebaseNetworkException(
        _codeNoInternetConnection,
        'Please try again in a good communication environment.',
      );

  /// エラーコード
  final String code;
  final String description;

  static const _codeUnknown = 'unknown';
  static const _descriptionUnknown = 'unknown';
  static const _codeNoInternetConnection = 'no-internet-connection';

  @override
  String toString() => 'FirebaseNetworkException[$code]: $message';
}
