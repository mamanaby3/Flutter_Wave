import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:camera/camera.dart';
import 'package:cours_flutter/main.dart';
import 'package:cours_flutter/widget/card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});


  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  late CameraController controller;
  PageController pageController=PageController();
  int value=0;
  bool isFlashOn = false;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      controller.setFocusMode(FocusMode.auto);
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':

            break;
          default:

            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // void toggleFlash() async {
  //   try {
  //     await TorchLight.enableTorch();
  //   } catch (e) {
  //     // Handle error
  //     print('Error enabling torch: $e');
  //   }
  //
  // }
  void toggleFlash() async {
    try {
      if (isFlashOn) {
        await TorchLight.enableTorch();
        print('allumer');
      } else {
        await TorchLight.disableTorch();
        print('eteind');
      }
    } catch (e) {

      print('Error toggling torch: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    // List<AppBar> appBarList = [
    //   AppBar(
    //     backgroundColor: Colors.black.withOpacity(0.6),
    //     elevation: 0,
    //     leading: IconButton(
    //       icon: Icon(
    //         Icons.close,
    //         color: Colors.black,
    //       ),
    //       onPressed: () {
    //         Navigator.pop(context); // Revenir à l'écran précédent
    //       },
    //     ),
    //   ),
    //   AppBar(
    //     backgroundColor: Colors.white ,
    //     elevation: 0,
    //     leading: IconButton(
    //       icon: Icon(
    //         Icons.close,
    //         color: Colors.white,
    //       ),
    //       onPressed: () {
    //         Navigator.pop(context);
    //       },
    //     ),
    //   ),
    // ];
    return Scaffold(
    appBar:   AppBar(
      backgroundColor: Colors.black.withOpacity(0.6),
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.close,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context); // Revenir à l'écran précédent
        },
      ),

      actions: [
        IconButton(
          icon: Icon(
            isFlashOn ? Icons.flash_on : Icons.flash_off,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              isFlashOn = !isFlashOn;
            });
            toggleFlash();
          },
        ),
      ],
    ),
      body: Stack(

        children: [

          PageView(
            controller: pageController,

            children: [
              Stack(
                children: [
                  Center(
                    child: AspectRatio(
                        aspectRatio: MediaQuery.of(context).size.width /
                            MediaQuery.of(context).size.height,
                        child: CameraPreview(controller)),
                  ),
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6), BlendMode.srcOut),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              backgroundBlendMode: BlendMode.dstOut
                          ),
                        ),
                        Center(

                          child: Container(
                            margin: EdgeInsets.all(30),
                            height: 300,
                            width: 400,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),

                            ),
                          ),
                        )
                      ],
                      // onPageChanged: (index) {
                      //   setState(() {
                      //     value = 1; // Mettez à jour la valeur pour changer l'AppBar
                      //   });
                      // },
                    ),
                  )
                ],
              ),
              Container(
                color: Colors.white,
                child: Center(
                  child: RotatedBox(quarterTurns:1,child: CardWidget(isClickable: false,)),
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 30),
            child:  AnimatedToggleSwitch<int>.size(
              current: value,
              style: ToggleStyle(
                backgroundColor: Colors.black,
                indicatorColor: Colors.grey,
                borderColor: Colors.transparent,
                borderRadius: BorderRadius.circular(25.0),
                indicatorBorderRadius: BorderRadius.zero,
              ),
              values: const [0, 1],
              iconOpacity: 1.0,
              selectedIconScale: 1.0,
              indicatorSize: const Size.fromWidth(150),
              iconAnimationType: AnimationType.onHover,
              styleAnimationType: AnimationType.onHover,
              spacing: 2.0,
              customSeparatorBuilder: (context, local, global) {
                final opacity =
                ((global.position - local.position).abs() - 0.5)
                    .clamp(0.0, 1.0);
                return VerticalDivider(
                    indent: 10.0,
                    endIndent: 10.0,
                    color: Colors.white38.withOpacity(opacity));
              },
              customIconBuilder: (context, local, global) {
                final text = const ['Scanner un code', 'Ma carte'][local.index];
                return Center(
                    child: Text(text,
                        style: TextStyle(
                            color: Color.lerp(Colors.white, Colors.white,
                                local.animationValue))));
              },
              borderWidth: 0.0,
              onChanged: (i) => setState(() {
                value = i;
                pageController.animateToPage(value, duration: Duration(milliseconds: 100), curve: Curves.easeIn);
              }),
            ),
          )
        ],
      ),
    );
  }
}