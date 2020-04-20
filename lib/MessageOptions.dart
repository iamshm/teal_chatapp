import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MessageOptions extends StatefulWidget {
  final double height;
  final bool showBorders;

  const MessageOptions({Key key, this.height, this.showBorders: false})
      : super(key: key);

  @override
  _MessageOptionsState createState() => _MessageOptionsState();
}

class _MessageOptionsState extends State<MessageOptions> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 85);
    setState(() {
      _image = image;
    });
    String fileName = 'images/${basename(_image.path)}';
    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    // StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
  }

  Future getCamera() async {
    var camImage = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 85);
    setState(() {
      _image = camImage;
    });
    String fileName = 'images/${DateTime.now()}.png';
    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    //  StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
  }

  Future uploadPic() async {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.teal[400],
        borderRadius: widget.showBorders ? BorderRadius.circular(10) : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MessageOptionButton(icon: Icons.camera_alt, callback: getCamera),
              MessageOptionButton(icon: Icons.photo, callback: getImage),
              MessageOptionButton(icon: Icons.contacts, callback: () {}),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MessageOptionButton(
                icon: Icons.file_upload,
                callback: () {},
              ),
              MessageOptionButton(
                icon: Icons.music_note,
                callback: () {},
              ),
              MessageOptionButton(
                icon: Icons.location_on,
                callback: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}

//IconButtons

class MessageOptionButton extends StatelessWidget {
  final IconData icon;
  final Function callback;
  const MessageOptionButton({Key key, this.icon, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: callback,
      child: new Icon(
        icon,
        color: Colors.blue,
        size: 40.0,
      ),
      shape: new CircleBorder(),
      fillColor: Color(0xffe7eef4),
      elevation: 0,
      padding: const EdgeInsets.all(10.0),
    );
  }
}
