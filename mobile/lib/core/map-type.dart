class MapType {
  static String appControl = 'Lumen-App debugging123';
  static header(paramsToken) {
    Map data = {
      'Access-Control-Request-Headers': appControl,
      'Authorization': 'Render-App' + paramsToken,
    };
    return data;
  }
}
