class APIUrls {
  static final baseUrl = 'https://dash.korachat.com/';
  static final baseApiUrl = baseUrl + 'api/';
  static final category = baseApiUrl + 'getAllCat/?perent_id=';
  static final courses = baseApiUrl + 'courses';
  static final coursesByCatID = baseApiUrl + 'getAllCourses?cat_id=';

  static final login = baseApiUrl + 'login';
  static final register = baseApiUrl + 'register1';
  static final users = baseApiUrl + 'users';
  static final getUser = baseApiUrl + 'user';
  static final updateUser = baseApiUrl + 'users';
  static final forms = baseApiUrl + 'surveys';
  static final calendar = baseApiUrl + 'calendar';
  static final orders = baseApiUrl + 'survey_33s';
  static final settings = baseApiUrl + 'settings';
}
