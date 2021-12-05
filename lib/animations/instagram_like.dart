import 'package:animation_course/widget/heart_animated_widget.dart';
import 'package:flutter/material.dart';
class InstagramLike extends StatefulWidget {
  const InstagramLike({Key? key}) : super(key: key);

  @override
  _InstagramLikeState createState() => _InstagramLikeState();
}

class _InstagramLikeState extends State<InstagramLike> {
  bool isLiked = false;
  bool isHeartAnimating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
          children: [
            buildImage(),
            buildActions(),
          ],
    )

    );
  }
  Widget buildImage(){
    return GestureDetector(
      onDoubleTap: (){
        setState(() {
          isHeartAnimating = true;
          isLiked = true;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
              aspectRatio:1 ,
              child: Image.network('https://cdn.vox-cdn.com/thumbor/fogeVa6BmZrnS_CBo6SBQzDYJzY=/0x0:2040x1360/1200x800/filters:focal(857x517:1183x843)/cdn.vox-cdn.com/uploads/chorus_image/image/67026775/acastro_190919_1777_instagram_0001.0.0.jpg' , fit: BoxFit.cover,)

          ),
          Opacity(
            opacity: isHeartAnimating ? 1 : 0,
            child: HeartAnimatedwidget(
                child: Icon(Icons.favorite , color: Colors.white, size: 100,) , isAnimating: isHeartAnimating , duration: Duration(milliseconds: 700),
              onEnd:()=>setState(()=> isHeartAnimating = false),

            ),
          ),
        ],
      ),
    );
  }
  Widget buildActions(){
    final icon = isLiked ? Icons.favorite : Icons.favorite_border_outlined;
    final color = isLiked ? Colors.red : Colors.white;
    return Expanded(
      child: Container(
        // padding: EdgeInsets.all(4),
        child: Row(
          children: [
            HeartAnimatedwidget(
              isAnimating: isLiked,
              child: IconButton(
                  onPressed: (){
                setState(() {
                isLiked = !isLiked;
              });
                },
                  icon: Icon(icon , color: color, size: 28,)),
            )
          ],
        ),
      ),
    );
  }
}
