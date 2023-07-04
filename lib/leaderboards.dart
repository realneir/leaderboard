import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'CebuArena',
            style: GoogleFonts.metalMania(
              fontSize: 30,
              color: Colors.blue[900],
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            color: Colors.blue,
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              color: Colors.blue,
              icon: Icon(Icons.person),
              onPressed: () {},
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.white],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: Colors.blue[900],
            indicatorColor: Colors.blue[900],
            indicatorWeight: 5,
            tabs: [
              Tab(text: 'MLBB'),
              Tab(text: 'VALORANT'),
              Tab(text: 'DOTA2'),
              Tab(text: 'CODM'),
              Tab(text: 'LOL'),
              Tab(text: 'WILDRIFT'),
            ],
          ),
          elevation: 20,
          titleSpacing: 20,
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            SubCategoryPage(mainCategory: 'MLBB'),
            SubCategoryPage(mainCategory: 'VALORANT'),
            SubCategoryPage(mainCategory: 'DOTA2'),
            SubCategoryPage(mainCategory: 'CODM'),
            SubCategoryPage(mainCategory: 'LOL'),
            SubCategoryPage(mainCategory: 'WILDRIFT'),
          ],
        ),
      );

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }
}

class SubCategoryPage extends StatelessWidget {
  final String mainCategory;

  SubCategoryPage({required this.mainCategory});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: TabBar(
            isScrollable: false,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.blue[300],
            tabs: [
              Tab(text: 'PLAYERS'),
              Tab(text: 'TEAMS'),
              Tab(text: 'CESAFI Schools'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildPlaceholderContent(mainCategory, 'PLAYERS'),
            buildPlaceholderContent(mainCategory, 'TEAMS'),
            buildPlaceholderContent(mainCategory, 'CESAFI Schools'),
          ],
        ),
      ),
    );
  }

  Widget buildPlaceholderContent(String mainCategory, String subCategory) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      color: Colors.blue[50],
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            height: 50, // or another height that suits your design
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Placeholder for ${mainCategory} - ${subCategory} TOP ${index + 1}',
              ),
            ),
          );
        },
      ),
    );
  }
}
