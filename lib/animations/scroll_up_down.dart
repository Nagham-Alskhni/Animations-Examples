import 'package:flutter/material.dart';

class ScrollUpDown extends StatefulWidget {
  const ScrollUpDown({Key? key}) : super(key: key);

  @override
  _ScrollUpDownState createState() => _ScrollUpDownState();
}

class _ScrollUpDownState extends State<ScrollUpDown> {
  final controller = ScrollController();
  int index = 0;
  @override
  void initState() {
    //to Detict where we  are scrolling now
    controller.addListener(() { listen();});
    super.initState();
  }
  void listen(){
    if(controller.position.atEdge) {  // at edge mean if we at the verystart or ver end
      final isTop = controller.position.pixels == 0;
      if(isTop){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Reached Start') , backgroundColor: Colors.black,));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Reached end') , backgroundColor: Colors.black,));

      }

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildList(),
      bottomNavigationBar: buildBottomBar(),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.arrow_upward) , onPressed: (){scrollUp();} ,),
    );
  }

  Widget buildList() {
    return ListView.builder(
      controller: controller,
        itemCount: 50,
        itemBuilder: (context, index) {
          return ListTile(
            title: Center(
              child: Text('${index + 1}'),
            ),
          );
        });
  }

  Widget buildBottomBar() {
    return BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: index,


        items: [
          BottomNavigationBarItem(icon: Icon(Icons.arrow_upward ,
          ) , title: SizedBox.shrink(),),
          BottomNavigationBarItem(icon: Icon(Icons.arrow_downward ,
          ) , title: SizedBox.shrink(),)
        ],
        onTap: (int index){
          setState(() {
            this.index  = index;
            final up = index == 0;
            if(up){
              scrollUp();
            }else{scrolldown();}
          });
        },
    );

  }

  void scrollUp(){
    final double  start = 0;
    controller.animateTo(start, duration: Duration(seconds: 1), curve: Curves.easeIn);
    // controller.jumpTo(start);   // they do the same jobe but animate to it better as a UI
  }
  void scrolldown(){
    final double  end = controller.position.maxScrollExtent;
    controller.animateTo(end, duration: Duration(seconds: 1), curve: Curves.easeIn);
    // controller.jumpTo(start);   // they do the same jobe but animate to it better as a UI
  }
}
