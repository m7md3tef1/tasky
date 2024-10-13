part of '../view.dart';

// ignore: must_be_immutable
class TaskDetails extends StatefulWidget {
  TaskDetails(this.title, this.image, this.desc, this.date, this.priority,
      this.status, this.id,
      {super.key});
  String? title;
  String? id;
  String? image;
  String? desc;
  String? date;
  String? priority;
  String? status;
  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  bool dirExists = false;
  dynamic externalDir = '/storage/emulated/0/Download/Qr_code';
  var scr = GlobalKey();
  @override
  void initState() {
    data = '';
    super.initState();
    _captureAndSavePng();
  }

  String data = '';
  final GlobalKey _qrkey = GlobalKey();
  Future<void> _captureAndSavePng() async {
    data = '';
    try {
      Future.delayed(const Duration(milliseconds: 2), () async {
        RenderRepaintBoundary boundary =
            _qrkey.currentContext!.findRenderObject() as RenderRepaintBoundary;
        // var image = await boundary.toImage(pixelRatio: 3.0);
        //
        // //Drawing White Background because Qr Code is Black
        // final whitePaint = Paint()..color = Colors.white;
        // final recorder = PictureRecorder();
        // final canvas = Canvas(
        //     recorder,
        //     Rect.fromLTWH(
        //         0, 0, image.width.toDouble(), image.height.toDouble()));
        // canvas.drawRect(
        //     Rect.fromLTWH(
        //         0, 0, image.width.toDouble(), image.height.toDouble()),
        //     whitePaint);
        // canvas.drawImage(image, Offset.zero, Paint());
        // final picture = recorder.endRecording();
        // final img = await picture.toImage(image.width, image.height);
        // ByteData? byteData = await img.toByteData(format: ImageByteFormat.png);
        // Uint8List pngBytes = byteData!.buffer.asUint8List();

        //Check for duplicate file name to avoid Override
        // String fileName = 'qr_code';
        // int i = 1;
        // while (await File('$externalDir/$fileName.png').exists()) {
        //   fileName = 'qr_code_$i';
        //   i++;
        // }
        setState(() {
          data = '${widget.id}';
        });
        // Check if Directory Path exists or not
        // dirExists = await File(externalDir).exists();
        // //if not then create the path
        // if (!dirExists) {
        //   await Directory(externalDir).create(recursive: true);
        //   dirExists = true;
        // }
        //
        // final file = await File('$externalDir/$fileName.png').create();
        // imagePaths.add(file.path);
        //
        // if (!mounted) return;
        // const snackBar = SnackBar(content: Text('QR code saved to gallery'));
        // print('QR code saved to gallery');
        //
        // await file.writeAsBytes(pngBytes).then((value) async {
        //   setState(() {
        //     data = 'QRCode \n${widget.id}\n $value ';
        //   });
        //   print(data);
        // }).catchError((onError) {
        //   print(onError);
        // });
      });
    } catch (e) {
      if (!mounted) return;
      const snackBar = SnackBar(content: Text('Something went wrong!!!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark),
            leadingWidth: 150.w,
            actions: [
              PopupMenuButton(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                          padding: const EdgeInsets.all(5),
                          child: InkWell(
                              onTap: () {
                                MagicRouter.navigateTo(EditTask(
                                    widget.title,
                                    widget.image,
                                    widget.desc,
                                    widget.date,
                                    widget.priority,
                                    widget.status,
                                    widget.id));
                              },
                              child: CustomText(
                                  text: 'Edit',
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500))),
                      PopupMenuItem(
                          padding: const EdgeInsets.all(5),
                          child: InkWell(
                              onTap: () {
                                TasksCubit.get(context)
                                    .deleteTask(widget.id, context);
                              },
                              child: CustomText(
                                  text: 'Delete',
                                  color: const Color(0xFFFF7D53),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500))),
                    ];
                  })
            ],
            leading: InkWell(
              onTap: () {
                MagicRouter.pop();
              },
              child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 20.w),
                  child: Row(
                    children: [
                      const Image(
                          image: AssetImage(AppImages.arrowRight),
                          color: Colors.black),
                      CustomText(
                          text: "  Task Details",
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: const Color(0xFF24252C)),
                    ],
                  )),
            ),
            toolbarHeight: 30.h),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  CachedNetworkImage(
                    imageUrl:
                        'https://todo.iraqsapp.com/images/${widget.image.toString()}',
                    imageBuilder: (context, imageProvider) => Container(
                      height: 225.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                      color: ColorManager.backgroundColor,
                    )),
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                  SizedBox(height: 15.h),
                  CustomText(
                      text: widget.title,
                      fontWeight: FontWeight.w700,
                      fontSize: 24.sp,
                      color: const Color(0xFF24252C)),
                  SizedBox(height: 8.h),
                  CustomText(
                      text: widget.desc,
                      fontWeight: FontWeight.w400,
                      line: 7,
                      fontSize: 14.sp,
                      color: const Color(0xFF24252C).withOpacity(.6)),
                  SizedBox(height: 5.h),
                  Expansion(
                    widget.date,
                    const Color(0xFF24252C),
                    enabled: false,
                    FontWeight.w400,
                    AppImages.calendar,
                    children: [],
                  ),
                  SizedBox(height: 5.h),
                  Expansion(
                    widget.status,
                    ColorManager.backgroundColor,
                    enabled: false,
                    FontWeight.w700,
                    AppImages.arrowDown,
                    children: [],
                  ),
                  SizedBox(height: 5.h),
                  Expansion(
                    widget.priority,
                    ColorManager.backgroundColor,
                    enabled: false,
                    FontWeight.w700,
                    AppImages.arrowDown,
                    flag: 'flag',
                    children: [],
                  ),
                  SizedBox(height: 5.h),
                  // QrImage(data: qrData),
                  data == ''
                      ? RepaintBoundary(
                          key: _qrkey,
                          child: SizedBox(
                            height: 326.h,
                            width: 1.sw,
                            child: const SpinKitFadingCircle(
                              color: ColorManager.backgroundColor,
                              size: 70.0,
                            ),
                          ),
                        )
                      : RepaintBoundary(
                          key: _qrkey,
                          child: QrImageView(
                            data: data.toString(),
                            version: QrVersions.auto,
                            size: 350.w,
                            gapless: true,
                            embeddedImageStyle: QrEmbeddedImageStyle(
                              size: Size(
                                1.sw,
                                326.h,
                              ),
                            ),
                            errorStateBuilder: (ctx, err) {
                              return const Center(
                                child: Text(
                                  'Something went wrong!!!',
                                  textAlign: TextAlign.center,
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          ),
        ));
  }
}
