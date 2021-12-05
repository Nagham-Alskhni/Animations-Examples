import 'package:flutter/material.dart';
class ImageZoom extends StatefulWidget {
  const ImageZoom({Key? key}) : super(key: key);

  @override
  _ImageZoomState createState() => _ImageZoomState();
}

class _ImageZoomState extends State<ImageZoom> with SingleTickerProviderStateMixin {
  late TransformationController controller;
  late AnimationController animationController;
  Animation<Matrix4>? animation;
    OverlayEntry ? entry;
    final double maxScale = 4;
    double scale = 1;
  @override
  void initState() {
    // TODO: implement initState
    controller = TransformationController();
    animationController = AnimationController(vsync: this ,
        duration: Duration(milliseconds: 200) )..addListener(() {controller.value = animation!.value;})..addStatusListener((status) {
          if(status == AnimationStatus.completed){
            removeOverlay();
          }

    });
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      body: Center(
        child: buildImage(context),
      ),
    );
  }

   buildImage(BuildContext context) {


        return
          InteractiveViewer(
          transformationController: controller,
          clipBehavior: Clip.none,
          panEnabled: false,
          minScale: 1,
          maxScale: 4,
          onInteractionUpdate: (d){
            if(entry == null)return;
            this.scale = d.scale;
            entry!.markNeedsBuild();
          },
          onInteractionEnd: (d){
            if(d.pointerCount != 1)return;
            resetAnimation();
          },
onInteractionStart: (d){
            if(d.pointerCount < 2)return;
             if(entry == null){
               showOverlay(context);

             }
},
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network('https://image.shutterstock.com/image-photo/playful-happy-panda-china-260nw-1390386575.jpg'),
            ),
          ),
        );

  }

  void resetAnimation(){
    animation = Matrix4Tween(
      begin: controller.value,
      end: Matrix4.identity(),
    ).animate(CurvedAnimation(parent: animationController,
        curve: Curves.bounceIn));
    animationController.forward(from: 0);

  }
  removeOverlay(){
    entry?.remove();
    entry = null;
  }
  void showOverlay(context){
    final renderBox = context.findRenderObject()! as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    entry = OverlayEntry(builder: (context){
      final opacity = ((scale - 1) / (maxScale - 1)).clamp(scale , maxScale);
      return Stack(
        children: [
          Positioned.fill(child: Opacity( opacity: 1.0,
              child: Container(color: Colors.black,))),
          buildImage(context),
        ],
      );
    });
final overlay  = Overlay.of(context)!;
overlay!.insert(entry!);

  }
}

