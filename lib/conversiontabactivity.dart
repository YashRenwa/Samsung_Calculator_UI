import 'package:flutter/material.dart';

class NestedTabBar extends StatefulWidget {
  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  TabController _nestedTabController;

  @override
  void initState() {
    super.initState();

    _nestedTabController = new TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        TabBar(
          isScrollable: true,
          controller: _nestedTabController,
          unselectedLabelColor: Colors.white,
          indicator: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
              side: BorderSide(color: Colors.white),
            ),
          ),
          tabs: <Widget>[
            Tab(
              child: Text("Area"),
            ),
            Tab(
              child: Text("Length"),
            ),
            Tab(
              child: Text("Temperature"),
            ),
            Tab(
              child: Text("Volume"),
            ),
            Tab(
              child: Text("Mass"),
            ),
            Tab(
              child: Text("Data"),
            ),
            Tab(
              child: Text("Speed"),
            ),
            Tab(
              child: Text("Time"),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: screenHeight * 0.4,
          margin: EdgeInsets.only(left: 16.0, right: 16.0),
          child: TabBarView(
            controller: _nestedTabController,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 0.5,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 0.5,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 0.5,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                    Container(
                      height: 0.5,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 0.5,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                    Container(
                      height: 0.5,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 0.5,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                    Container(
                      height: 0.5,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 0.5,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    ),
                    Container(
                      height: 0.5,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 0.5,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          color: Colors.tealAccent,
                        ),
                      ),
                    ),
                    Container(
                      height: 0.5,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 0.5,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          color: Colors.amberAccent,
                        ),
                      ),
                    ),
                    Container(
                      height: 0.5,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 0.5,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          color: Colors.brown,
                        ),
                      ),
                    ),
                    Container(
                      height: 0.5,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
