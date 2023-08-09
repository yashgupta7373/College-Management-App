import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yns_college_management/pages/profile_page.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isShowUsers = false;

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(223, 38, 166, 153),
        appBar: AppBar(
          backgroundColor: Colors.teal[700],
          elevation: 0,
          title: TextFormField(
            controller: searchController,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
            decoration: const InputDecoration(
                labelText: 'Search for a user',
                labelStyle: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.normal)),
            onFieldSubmitted: (String _) {
              setState(() {
                isShowUsers = true;
              });
            },
          ),
        ),
        body: isShowUsers
            ? FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .where('name',
                        isGreaterThanOrEqualTo: searchController.text)
                    .get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ((snapshot.data! as dynamic).docs.length >= 1)
                      ? ListView.builder(
                          itemCount: (snapshot.data! as dynamic).docs.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ProfilePage(
                                    uid: (snapshot.data! as dynamic).docs[index]
                                        ['uid'],
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  color: Colors.teal[200],
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        (snapshot.data! as dynamic).docs[index]
                                            ['photoUrl'],
                                      ),
                                      radius: 22,
                                    ),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          (snapshot.data! as dynamic)
                                              .docs[index]['name'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal,
                                              color: Colors.teal[900],
                                              fontSize: 14),
                                        ),
                                        Text(
                                          (snapshot.data! as dynamic)
                                              .docs[index]['id'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal,
                                              color: Colors.teal[700]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset('assets/images/img81.json'),
                          ],
                        );
                })
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/images/img76.json'),
                ],
              ));
  }
}
