class ApiHelper {

  static const String _baseUrl = 'https://al-mokhalis.smart-ab.com/api';


  static const String SIGNIN = '$_baseUrl/';
  static const String FACEBOOK_LOGIN = 'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture&access_token=';


  static Map<String, String> registerHeader({required String language, required String deviceName}) {
    return  {
      'Accept-Language': language,
      'X-Requested-With': 'XMLHttpRequest',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'X-Client-Device-Name': deviceName,
      'Connection': 'keep-alive',
    };
  }

  static Map<String, String> langHeader({required String language}) {
    return {'Accept-Language': language};
  }

  static Map<String, String> tokenHeader({required String token}) {
    return {'Authorization': token};
  }

  static Map<String, String> headers({required String language}) {
    return {
      'Content-Type': 'application/json',
      'Accept-Language': language
    };
  }

  static Map<String, String> allHeader(
      {required String token, required String language}) {
    return {
      'Content-Type': 'application/json',
      'Authorization': token,
      'Accept-Language': language
    };
  }

  static Map<String, String> adminHeader(
      {required String token, required String language}) {
    return {
      'Accept': 'application/json',
      'Authorization': token,
      'Accept-Language': language
    };
  }

  static String get baseUrl => baseUrl;

  static Map<String, String> getHeader(
      {required String token, required String appLanguage}) {
    return {'Authorization': token, 'Accept-Language': appLanguage};
  }
}
