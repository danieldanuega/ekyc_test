import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyForm extends StatefulWidget {
  @override
  _VerifyFormState createState() => _VerifyFormState();
}

class _VerifyFormState extends State<VerifyForm> {
  String idCardFile,
      selfieFile,
      similarityIdIdSelfie = "",
      similarityIdSelfie = "";
  final _url = "http://10.3.189.64:7000/cekid";

  Future<String> _chooseFileAndConvert64() async {
    String file64;

    await FilePicker.getFile(type: FileType.image).then((image) {
      final b64 = image.readAsBytesSync();
      file64 = base64Encode(b64);
    }).catchError((error) {
      file64 = "Type is not image";
    });

    return file64;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Neumorphic(
          style: NeumorphicStyle(
            depth: 7,
            shape: NeumorphicShape.concave,
          ),
          padding: EdgeInsets.all(12.0),
          child: Text("ID face and selfie face verification"),
          textStyle: GoogleFonts.lato(fontSize: 18.0, color: Colors.black87),
        ),
        SizedBox(height: 100.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text('')],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NeumorphicButton(
              child: Text("ID Card"),
              style: NeumorphicStyle(
                lightSource: LightSource.topLeft,
                depth: 5,
              ),
              onPressed: () async {
                String temp64 = await _chooseFileAndConvert64();
                setState(() {
                  idCardFile = temp64;
                });
              },
            ),
            SizedBox(width: 8.0),
            NeumorphicButton(
              child: Text("Selfie picture"),
              style: NeumorphicStyle(
                lightSource: LightSource.topLeft,
                depth: 5,
              ),
              onPressed: () async {
                String temp64 = await _chooseFileAndConvert64();
                setState(() {
                  selfieFile = temp64;
                });
              },
            ),
          ],
        ),
        SizedBox(height: 50.0),
        NeumorphicButton(
          child: Text("Verify"),
          onPressed: () async {
            var response = await http.post(
              _url,
              body: convert.jsonEncode({
                "card_image": idCardFile,
                "selfie_image": selfieFile,
              }),
              headers: {
                "Authorization": "merchantErick",
              },
            );
            var resp = convert.jsonDecode(response.body);
            setState(() {
              similarityIdIdSelfie = resp["similarity_id_selfieId"];
              similarityIdSelfie = resp["similarity_id_selfie"];
            });
          },
        ),
        SizedBox(height: 25.0),
        Neumorphic(
          child: Text(
              "Similarity between Id and Id in Selfie: $similarityIdIdSelfie"),
        ),
        SizedBox(height: 25.0),
        Neumorphic(
          child: Text(
              "Similarity between Id and Selfie face: $similarityIdSelfie"),
        )
      ],
    );
  }
}
