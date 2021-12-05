import 'dart:io';
import 'dart:ui';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movies_watchlist_app/home/controller/text_validator.dart';

import '../../constants.dart';

class AddMovieScreen extends StatefulWidget {
  const AddMovieScreen({Key? key}) : super(key: key);

  @override
  _AddMovieScreenState createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  // late ScrollController scrollController;
  File? image;
  ImagePicker picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _directorController = TextEditingController();

  @override
  void initState() {
    // scrollController = ScrollController();
    super.initState();
  }

  Future selectImage() async {
    var imageFile = await picker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() {
        image = File(imageFile.path);
      });
    }
  }

  Future uploadPic() async {
    Reference _ref = firebaseStorage.ref().child('posters');
    UploadTask uploadTask = _ref.putFile(image!);
    String downloadUrl = await uploadTask.then(
      (p0) => p0.ref.getDownloadURL(),
    );
    print(downloadUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Add a Movie'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 30,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: image != null
                            ? DecorationImage(
                                image: FileImage(image!),
                                fit: BoxFit.cover,
                              )
                            : const DecorationImage(
                                image: NetworkImage(placeHolderImage),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    InkWell(
                      onTap: selectImage,
                      child: Container(
                        alignment: Alignment.center,
                        height: 200,
                        decoration:
                            BoxDecoration(color: Colors.black.withOpacity(0.2)),
                        child: const Text(
                          'Click to Add/Change poster',
                          style: TextStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: TextFormField(
                    controller: _titleController,
                    cursorColor: Colors.white,
                    validator: (_) =>
                        TextValidator.checkIfEmpty(_titleController.text),
                    decoration: InputDecoration(
                      labelText: 'Movie Name',
                      labelStyle: const TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: kRed,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: kRed,
                        ),
                      ),
                      errorStyle: TextStyle(color: Colors.red.shade100),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: TextFormField(
                    controller: _directorController,
                    cursorColor: Colors.white,
                    validator: (_) =>
                        TextValidator.checkIfEmpty(_directorController.text),
                    decoration: InputDecoration(
                      labelText: 'Director',
                      labelStyle: const TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: kRed,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: kRed,
                        ),
                      ),
                      errorStyle: TextStyle(color: Colors.red.shade100),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    uploadPic();
                    //   usersRef
                    //       .doc(firebaseAuth.currentUser!.uid)
                    //       .collection('watchlist')
                    //       .add(
                    //     {
                    //       'movieTitle': _titleController.text,
                    //       'director': _directorController.text,
                    //       'poster': placeHolderImage,
                    //     },
                    //   ).then(
                    //     (_) => Navigator.pop(context),
                    //   );
                    // }
                  },
                  style: elevatedButtonStyle,
                  child: const Text(
                    'Add Movie',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // scrollController.dispose();
    _titleController.dispose();
    _directorController.dispose();
    super.dispose();
  }
}
