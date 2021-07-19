import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/core/server.dart';
import 'package:mobile/vm/sp.dart';

class PostVM {
  // static String token =
  // 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjBhNmQ2Y2E4Yzk2MGI5NmU3ZDAwMTdkZTE4Y2E2MzNhNTU5OTY3MjVkNGI5YjBkOWM3ZjVlYjhmNzBmZTdiNjY1MTEyMzQ1NmUwYTExZWY1In0.eyJhdWQiOiIxIiwianRpIjoiMGE2ZDZjYThjOTYwYjk2ZTdkMDAxN2RlMThjYTYzM2E1NTk5NjcyNWQ0YjliMGQ5YzdmNWViOGY3MGZlN2I2NjUxMTIzNDU2ZTBhMTFlZjUiLCJpYXQiOjE2MjY0NDg4NzUsIm5iZiI6MTYyNjQ0ODg3NSwiZXhwIjoxNjU3OTg0ODc1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.Lt9htsbDI82OIEbOsgQ8bgmLUIdy_pwSDqnHACxoeoVet-_WpzUM9bF5GnVdtMD385ptXKX__I9bd2Hb7MxJiiRlvvd3CsYt8Uht8s96JJLL5aCG-ojGNETX6xJFnqDWeN3_96APBNFQN9ZwOm_dtIoyKJsUSIaW_49f-iFGcHXe0xlMdfqDWUUHb7xPaFKHhR5a8KEdlS4pt5M87Q-C4CT6XeWCTscp_L0bVxCVLD2NSSDwaw7Rp1ObdB6lkupjqTmB7lsu9CKXspv3KrpLQBnwTmscOvNvfJbutI7hBzS4gSHbYeSWDRncN31aYgYEqyWiMPs4X39fSp6qnvE3Sx-1Pw-ZtVMPvmzBjvDwDkJ9rQEPnenlpGXuOG_QbAA4cqmlU-od4q7cci2UsfAvGs8UYG9T0nHlXEulu4xTKunSZoBNyUiUdcfJlI1xo5AniVIE04t4_CktzLGM88onLiAAlDUWI-O9Ku8drZ0D7W4WlFqnerk13fD_UnXS-pGjew5YAb4XKlxTkBRtEcBzHKjaB5y5vhvZXssK96H4SYlCt6CqRh0aq1mUWmGVb6zYgtYWmBUXRgwboj5VRgmbB-bM9hSVvhOsfwvVDXEFUk29uRv3o0xLKhngID30WCclrFIBYqtP2zVQoIESBuxyAndvcRjsg3Y66L2spJh_Za8';

  static Future logout() async {
    SP.save('token', '');
    return 'ok';
  }

  static Future login(String email, String password) async {
    final response = await http.post(Server.endPoint + "auth/login", body: {
      'email': email,
      'password': password,
    });
    try {
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        SP.save('token', res['token']);
        SP.save('userID', res['users']['id'].toString());
        SP.save('username', res['users']['username'].toString());
        return 'ok';
      } else {
        return 'no';
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  static Future regis(String email, password, konfirm, username, name) async {
    final response = await http.post(Server.endPoint + "auth/signup", body: {
      'email': email,
      'confirm_password': konfirm,
      'password': password,
      'name': name,
      'username': username,
    });
    try {
      var res = json.decode(response.body);
      print(res.toString());
      if (response.statusCode == 200) {
        SP.save('token', res['token']);
        SP.save('userID', res['users']['id'].toString());
        SP.save('username', res['users']['username'].toString());
        return 'ok';
      } else {
        return 'no';
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  static Future cekAuth() async {
    var token = await SP.getToken();
    final response = await http.get(Server.endPoint + "comment/3", headers: {
      'Authorization': 'Bearer ' + token.toString() ?? '',
    });
    try {
      if (response.statusCode == 200) {
        return 'home';
      } else {
        return 'login';
      }
    } on Exception catch (e) {
      print(e.toString());
      return 'login';
    }
  }

  static Future index() async {
    var token = await SP.getToken();
    final response = await http.get(Server.endPoint + "post",
        headers: {'Authorization': 'Bearer ' + token.toString()});
    try {
      var data = json.decode(response.body);
      return data;
    } on Exception catch (e) {
      return 'error' + e.toString();
    }
  }

  static Future showLike(String id) async {
    var token = await SP.getToken();
    final response = await http.get(Server.endPoint + "like/show/" + id,
        headers: {'Authorization': 'Bearer ' + token.toString()});
    try {
      var data = json.decode(response.body);
      return data;
    } on Exception catch (e) {
      return 'error' + e.toString();
    }
  }

  static Future detail(String id) async {
    var token = await SP.getToken();
    final response = await http.get(Server.endPoint + "comment/" + id,
        headers: {'Authorization': 'Bearer ' + token.toString()});
    try {
      var data = json.decode(response.body);
      return data;
    } on Exception catch (e) {
      return 'error' + e.toString();
    }
  }

  static Future storeComment(String idPost, value) async {
    var token = await SP.getToken();

    final response =
        await http.post(Server.endPoint + "comment/store", headers: {
      'Authorization': 'Bearer ' + token.toString()
    }, body: {
      'post_id': idPost,
      'value': value,
    });
    try {
      var data = json.decode(response.body);
      print('data');
      return data;
    } on Exception catch (e) {
      return 'error' + e.toString();
    }
  }

  static Future updatePost(String id, value) async {
    var token = await SP.getToken();
    final response = await http.post(Server.endPoint + "post/edit", headers: {
      'Authorization': 'Bearer ' + token.toString()
    }, body: {
      'id': id,
      'value': value,
    });
    try {
      var data = json.decode(response.body);
      print('data');
      return data;
    } on Exception catch (e) {
      return 'error' + e.toString();
    }
  }

  static Future likes(String postid) async {
    var token = await SP.getToken();

    final response = await http.post(Server.endPoint + "like/store", headers: {
      'Authorization': 'Bearer ' + token.toString()
    }, body: {
      'post_id': postid,
    });
    try {
      var data = json.decode(response.body);
      print('data');
      return data;
    } on Exception catch (e) {
      return 'error' + e.toString();
    }
  }
}
