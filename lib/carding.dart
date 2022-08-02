import 'package:flutter/material.dart';


class Carding extends StatefulWidget {

  @override
  State<Carding> createState() => _CardingState();
}

class _CardingState extends State<Carding> {

  final List<String> _list = [
    'post 1','post 2','post 3','post 4','post 5','post 6','post 7','post 8','post 9','post 10','post 11','post 12'
  ];

  double topContainer = 0;

  ScrollController controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = ScrollController(initialScrollOffset: 2);
    controller.addListener(() {
      double value = controller.offset/500;

      setState((){
        topContainer = value;
      });

    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cards'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50,bottom: 40),
        child: ListView.builder(
          controller: controller,
          itemCount: 12,
            itemBuilder: (BuildContext context, int index){
            double scale = 1.0;
            if(topContainer >0.55){
              scale =  index + 0.55 - topContainer;
              if(scale<0){
               scale = 0;
              }
              else if(scale>1){
                scale = 1;
              }
            }

              return Transform(
                alignment: Alignment.topCenter,
                transform: Matrix4.identity()..scale(scale,scale),
                  child: MySquare(number: index.toDouble(),child: _list[index],));
            }),
      ),
    );
    }
  }

  class MySquare extends StatelessWidget {
  final String child;
  final double number;
  MySquare({required this.number,required this.child});

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding:  EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Container(

          height: 450,
          child: Card(


            elevation: 10,
            shadowColor: Colors.blueGrey,

            child : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 70,child: Container(
                  child: Image.asset('images/image_${number.toInt()+1}.jpg',fit: BoxFit.fill,),),
                ),
                Expanded(flex: 10,
                  child: Container(
                    child: Text(
                      child,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Expanded(flex: 20,child: Container(color: Colors.white,),),
              ],
            ),
          ),
        ),
      );
    }
  }

