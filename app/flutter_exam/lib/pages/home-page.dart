import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/server/cubit/app/app-cubit.dart';
import 'package:flutter_exam/server/cubit/state/cubit-state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    context.read<AppCubits>().loadHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.purple,
                        borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(75))),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20, top: 10),
                                child: Text(
                                  'Hi Guy',
                                  style:
                                  TextStyle(fontSize: 40, color: Colors.white),
                                ),
                              ),
                            )),
                        const Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20, top: 20),
                                child: Text(
                                  'Where are you going next',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            )),
                        Expanded(
                          child: Stack(fit: StackFit.expand, children: [
                            Positioned(
                              //left: 5,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                                margin:
                                const EdgeInsets.only(left: 50, right: 20),
                                child: const TextField(
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.search),
                                    labelText: 'Search your destination',
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 5,
                  child: Container(
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Popular Destinations',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                             child: BlocBuilder<AppCubits,CubitStates>
                                (builder: (context,state){
                                if(state is DestinationLoadedState){
                                  var place = state.places;
                                  return PageView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: place.length,
                                      itemBuilder: (context,index){
                                        return Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(25)),
                                            image: DecorationImage(
                                              image: AssetImage(place[index].linkImage ?? ''), // Provide a default value if linkImage is null
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.all(15),
                                                  child: Align(
                                                    alignment: Alignment.topRight,
                                                    child: Icon(
                                                      Icons.favorite,
                                                      size: 35.0,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Padding(
                                                  padding: EdgeInsets.only(left: 15),
                                                  child: Text(
                                                    place[index].namePlace ?? '',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(15),
                                                  child: Container(
                                                    width: 100,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      color: Color.fromRGBO(255, 255, 255, 0.5),
                                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets.all(10),
                                                          child: Icon(
                                                            Icons.star,
                                                            size: 30.0,
                                                            color: Colors.yellow,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(left: 15),
                                                          child: Text(
                                                            place[index].score ?? '', // Provide a default value if score is null
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                }
                                return Container(child: Text('error'),);

                              })
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(25)),
                              color: Color(0xFFD3D3D3)),
                          child: const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 5, top: 5, bottom: 5),
                                child: Icon(
                                  Icons.home,
                                  size: 30.0,
                                  color: Colors.blue,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: 10, top: 5, bottom: 5),
                                child: Text(
                                  'HOME',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              )
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.search,
                          size: 30.0,
                          color: Colors.grey,
                        ),
                        const Icon(
                          Icons.business_center_rounded,
                          size: 30.0,
                          color: Colors.grey,
                        ),
                        const Icon(
                          Icons.person,
                          size: 30.0,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ))
            ],
          )),
    );
  }

}