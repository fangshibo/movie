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
                  backgroundImage: NetworkImage('https://fsb.nn888.xyz/111.jpg'),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://fsb.nn888.xyz/222.jpg"))

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