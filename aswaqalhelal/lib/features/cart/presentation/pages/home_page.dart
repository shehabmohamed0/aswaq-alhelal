import 'dart:developer';
import 'dart:io';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:aswaqalhelal/features/cart/presentation/pages/widgets/app_drawer.dart';
import 'package:aswaqalhelal/l10n/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:photo_view/photo_view.dart';
import 'package:root_package/l10n/l10n.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/widgets/snack_bar.dart';
import 'package:users_presentation/features/auth/bloc/app_status/app_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ImagePicker imagePicker;
  late final ImageCropper imageCropper;
  late final Stream<DocumentSnapshot<Map<String, dynamic>>> stream;
  @override
  void initState() {
    imagePicker = ImagePicker();
    imageCropper = ImageCropper();
    stream = FirebaseFirestore.instance.doc('home/main').snapshots();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).aswaqLhelal),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(),
          Expanded(
            child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (!snapshot.data!.exists ||
                      snapshot.data!.data()!['url'] == null) {
                    return Container(
                      color: Colors.grey.shade200,
                      alignment: Alignment.center,
                      child: Text(
                        AppLocalizations.of(context).noImage,
                        style: TextStyle(fontSize: 24),
                      ),
                    );
                  }
                  return InkWell(
                    onLongPress: user.phoneNumber == '+201001042111' ||
                            user.phoneNumber == '+201006363888' ||
                            user.phoneNumber == '+201001011171' ||
                            user.phoneNumber == '+201553583931'
                        ? () {
                            showImageDialog(context, () => func(context));
                          }
                        : null,
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              body: PhotoView(
                                heroAttributes: const PhotoViewHeroAttributes(
                                    tag: 'TestScale'),
                                imageProvider: CachedNetworkImageProvider(
                                    snapshot.data!.get('url')),
                              ),
                            ),
                          ))
                    },
                    child: Hero(
                      tag: 'TestScale',
                      child: CachedNetworkImage(
                        imageUrl: snapshot.data!.get('url'),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.center,
                      ),
                    ),
                  );
                } else {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Container(
                      width: 222,
                      height: 222,
                      color: Colors.red,
                    );
                  }
                }
                return Container(
                  width: 222,
                  height: 222,
                  color: Colors.blue,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void func(BuildContext context) async {
    final XFile? xfile =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (!await InternetConnectionChecker().hasConnection) {
      showErrorSnackBar(context,
          RootPackageLocalizations.of(context).checkInternetConnection);
      return;
    }
    if (xfile != null) {
      final file = File(xfile.path);
      final croppedFile = await imageCropper.cropImage(
        sourcePath: file.path,
        cropStyle: CropStyle.rectangle,
        uiSettings: [
          AndroidUiSettings(lockAspectRatio: false),
          IOSUiSettings(),
        ],
      );

      if (croppedFile != null) {
        try {
          final file = File(croppedFile.path);
          EasyLoading.show(
            indicator: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
          final uploadTask = await FirebaseStorage.instance
              .ref('images/${basename(file.path)}')
              .putFile(file);
          final url = await uploadTask.ref.getDownloadURL();

          await FirebaseFirestore.instance
              .doc('home/main')
              .set({'url': url}, SetOptions(merge: true));

          EasyLoading.dismiss();
          showSuccessSnackBar(
              context, AppLocalizations.of(context).uploadedSucceffully);
        } catch (e) {
          EasyLoading.dismiss();
          showErrorSnackBar(
              context, AppLocalizations.of(context).uploadingFailed);
        }
      }
    }
  }
}

void showImageDialog(BuildContext context, VoidCallback action) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  action();
                },
                child: Text(AppLocalizations.of(context).updateImage)),
          ],
        );
      });
}
