class AccessTokenResponse {
  final String access_token;
  final String tokenType;
  final String redirectTo;

  AccessTokenResponse({
    this.access_token,
    this.tokenType,
    this.redirectTo,
  });

  factory AccessTokenResponse.fromJson(Map<String, dynamic> json) {
    return AccessTokenResponse(
      access_token: json['access_token'],
      tokenType: json['tokenType'],
      redirectTo: json['tokenType'],
    );
  }
}
