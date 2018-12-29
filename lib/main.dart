import 'package:flutter/material.dart';
import './movie/list.dart';

void main()=>runApp(MaterialApp(
  title:"sdkfa",
  home:Myhome()

));

class Myhome extends StatefulWidget{
_MyhomeState createState()=> _MyhomeState();
}

class _MyhomeState  extends State<Myhome>{
  @override
  Widget build(BuildContext content){
    return DefaultTabController(
      length: 3,
      child:Scaffold(
      appBar: AppBar(
        title: Text("电影列表"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){},),

        ],
       
      ),
       drawer:Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("ab"),
                accountEmail: Text("abc@inst.cn"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1546008629750&di=5c4d1d4b6178c63eb5838d7fe4723ce0&imgtype=0&src=http%3A%2F%2Fimg4.duitang.com%2Fuploads%2Fitem%2F201603%2F08%2F20160308194407_24Prs.thumb.700_0.png'),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1546008797868&di=e190370ab3bdd7215b893a60a19e73ee&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201503%2F18%2F20150318173303_kVrhA.jpeg"))

                ),

              ),
              ListTile(title: Text('用户反馈'),trailing: Icon(Icons.feedback),),
              ListTile(title: Text('系统设置'),trailing: Icon(Icons.settings),),
              ListTile(title: Text('我要发布'),trailing: Icon(Icons.send),),
              Divider(),
              ListTile(title: Text('注销'),trailing: Icon(Icons.exit_to_app),),
              
            ],
          ),
        ),
      bottomNavigationBar: Container(
        height: 50,

        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: TabBar(
          labelStyle: TextStyle(height: 0),
        tabs: <Widget>[
          Tab(icon: Icon(Icons.movie_filter),text: "正在热映",),
          Tab(icon: Icon(Icons.movie_creation),text: "即将上映",),
          Tab(icon: Icon(Icons.local_movies),text: "top250",),
        ],
      ),
      ),

      body:TabBarView(
        children: <Widget>[
          MovieList(mt:'in_theaters'),
          MovieList(mt:'coming_soon'),
          MovieList(mt:'Top250'),
       
        ],
      ),

      
    ),
      );
  }
}