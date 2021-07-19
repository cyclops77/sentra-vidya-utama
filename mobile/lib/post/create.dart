import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/core/button.dart';
import 'package:mobile/core/href.dart';
import 'package:mobile/core/input.dart';
import 'package:mobile/core/server.dart';
import 'package:mobile/core/size.dart';
import 'package:mobile/home/index.dart';
import 'package:mobile/vm/sp.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  TextEditingController x = new TextEditingController();
  String fileName = '';
  Future<File> foto;
  String base64Image;
  File tmpFile;
  var token;

  getImage(context) async {
    final imgSrc = await showDialog<ImageSource>(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Pilih sumber gambar"),
              actions: <Widget>[
                MaterialButton(
                  child: Text("Kamera"),
                  onPressed: () => Navigator.pop(context, ImageSource.camera),
                  // onPressed: () => Navigator.pop(context, ImageSource.camera),
                ),
                MaterialButton(
                  child: Text("Galeri"),
                  onPressed: () => Navigator.pop(context, ImageSource.gallery),
                )
              ],
            ));
    if (imgSrc != null) {
      setState(() {
        // ignore: deprecated_member_use
        foto = ImagePicker.pickImage(source: imgSrc);
        //print('fotonya ' + foto.toString());
        //print(foto);
      });
    }
  }

  Widget showImage() {
    return Container(
      child: FutureBuilder<File>(
        future: foto,
        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            tmpFile = snapshot.data;
            fileName = tmpFile.path.split("/").last;
            base64Image = base64Encode(snapshot.data.readAsBytesSync());

            return Container(
              height: 275,
              alignment: Alignment.center,
              child: Image.file(
                tmpFile,
                fit: BoxFit.cover,
              ),
            );
          } else if (snapshot.error != null) {
            return Text("Error");
          } else {
            return Container(
              height: 275,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text(
                "Pilih gambar",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
            );
          }
        },
      ),
    );
  }

  void simpan() async {
    var tokenD = await SP.getToken();
    setState(() {
      token = tokenD;
    });
    Map<String, String> headers = {
      'Authorization': 'Bearer ' + token,
      'Accept': 'application/json'
    };
    var request;
    if (tmpFile.path != null) {
      request = http.MultipartRequest(
        'POST',
        Uri.parse(Server.endPoint + 'post/store'),
      );
      request.files
          .add(await http.MultipartFile.fromPath('gambar', tmpFile.path));
    }
    request.headers.addAll(headers);
    request.fields['value'] = x.text;
    http.Response response =
        await http.Response.fromStream(await request.send());
    var dataX = json.decode(response.body);
    // LoadingCircles.fClose();
    if (response.statusCode == 200) {
      print(dataX);
      Routes.stfR(context, InstaHome());
    } else {
      print(dataX);
      // LoadingCircles.fFails(
      //   msg: dataX['msg']['bukti'][0],
      // );
    }
    //print(dataX['status']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Padding(
              padding: EdgeInsets.only(left: displayWidth(context) * 0.025),
              child: Icon(Icons.arrow_back_ios),
            ),
            onPressed: () {
              Routes.stfR(context, InstaHome());
            }),
        backgroundColor: new Color(0xfff8faf8),
        elevation: 0,
        title: Text(
          "Buat Postingan",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        child: ListView(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: displayWidth(context) * 0.05),
              child: InkWell(
                  onTap: () {
                    getImage(context);
                  },
                  child: showImage()),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: displayWidth(context) * 0.05),
              child: Input(
                controller: x,
                lines: 5,
                placeholder: "Masukkan caption disini",
                input: TextInputType.multiline,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: displayWidth(context) * 0.05),
              child: Button(
                fun: () {
                  simpan();
                },
                isi: "Buat Postingan",
                height: 50,
                colorButton: Colors.blue,
                colorText: Colors.white,
                radius: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
