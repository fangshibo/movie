import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './deteil.dart';

Dio dio=new Dio();

class MovieList extends StatefulWidget{
  MovieList({Key key,@required this.mt}):super(key:key);
  final String mt;


_MovieListState createState()=> _MovieListState();
}

class _MovieListState  extends State<MovieList> with AutomaticKeepAliveClientMixin{
  int page=1;
  int pagesize=10;
  var mlist=[];
  var total=0;

  bool get wantKeepAlive=>true;

  @override
    void initState() {
      
      super.initState();
      getMovieList();
    }
  @override
  Widget build(BuildContext content){
    // return Text('这是电影列表页面---'+widget.mt+'---${mlist.length}');
    return ListView.builder(
      itemCount: mlist.length,
      itemBuilder: (BuildContext ctx,int i){
        var mitem=mlist[i];
        // return Text(mitem['title']);
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext ctx){
                return new MoveieDetail(id:mitem['id'],title: mitem['title'],);
              }
            ));
          },
          child: Container(
          height: 200,
          decoration: BoxDecoration(color: Colors.white,border: Border(top:BorderSide(color: Colors.black12))),
          child: Row(
          children: <Widget>[
            Image.network(mitem['images']['small'],width: 130,height: 180,fit: BoxFit.cover,),
            Container(
              padding: EdgeInsets.only(left:10),
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                Text('电影名称：${mitem['title']}'),
                Text('上映年份：${mitem['year']}年'),
                Text('电影类型：${mitem['genres'].join('')}'),
                Text('豆瓣评分：${mitem['rating']['average']}分'),
                Text('主要演员：${mitem['title']}'),
              ],
            ),
            ),
          ],
        ),

        ),
        );
      },
    );
  }

  getMovieList() async {
    int offset =(page - 1)*pagesize;

    
    var response = await dio.get('http://www.liulongbin.top:3005/api/v2/movie/${widget.mt}?start=$offset&count=$pagesize');
    var result=response.data;
    print(result);

    setState(() {
          mlist=result['subjects'];
          total=result['total'];
        });
  }
}