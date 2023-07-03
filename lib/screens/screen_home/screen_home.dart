import 'package:flutter/material.dart';
import 'package:kannada_movies/network_helper/network_helper.dart';
import 'package:kannada_movies/screens/screenLogin/screen_login.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    // NetworkHelper.fetchDataFromApi();
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       Icons.menu,
        //     )),
        title: const Text("Movies"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: NetworkHelper.fetchDataFromApi(),
        builder: (context, snapshot) {
          // itemCount: 2,
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            final movieList = snapshot.data;
            final movies = movieList!.result;

            return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return ListView(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(
                                Icons.arrow_drop_up_rounded,
                                size: 80,
                              ),
                              Text(
                                "${movie.voting}",
                                style: const TextStyle(fontSize: 20),
                              ),
                              const Icon(
                                Icons.arrow_drop_down_rounded,
                                size: 80,
                              ),
                              const Text("Votes"),
                            ],
                          ),
                          Container(
                            height: 170,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                movie.poster,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            // color: Colors.amberAccent,
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie.title,
                                  style: const TextStyle(
                                      // maxLines: 1,

                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Genre: ${movie.genre}",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    // overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Drector: ${movie.director}",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Starring: ${movie.stars}",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${movie.runTime} | ${movie.language} | ${movie.releasedDate}",
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${movie.pageViews} | Voted by ${movie.voting} people",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: ElevatedButton(
                            onPressed: () {
                              // NetworkHelper.fetchDataFromApi();
                            },
                            child: const Text("Watch Trailer")),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Divider(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },

        // physics: ScrollPhysics(),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        backgroundColor: const Color.fromARGB(255, 215, 240, 255),
        shadowColor: const Color.fromARGB(255, 95, 148, 255),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 70,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // // height: 600,
                // color: Colors.amber,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    color: const Color.fromARGB(115, 181, 181, 181)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // Important: Remove any padding from the ListView.
                    // padding: EdgeInsets.zero,
                    children: [
                      Image.asset(
                        "assets/WhatsApp_Image_2023-06-02_at_11.45.48-removebg-preview.png",
                        scale: 3,
                      ),
                      const Text(
                        "Company",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Geeksynergy Technologies Pvt Ltd",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Address",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Sanjayanagar, Bengaluru-56",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Phone",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "XXXXXXXXX09",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Email",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "XXXXXX@gmail.com",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(200, 175, 175, 175)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      // log("message");
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) {
                          return const ScreenLogin();
                        },
                      ));
                    },
                    child: const Text(
                      "Log out",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
