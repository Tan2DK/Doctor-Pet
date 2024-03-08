import 'package:flutter/material.dart';

class ReviewView extends StatefulWidget {
  const ReviewView({Key? key}) : super(key: key);

  @override
  State<ReviewView> createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {
  var isReply = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 234, 234),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'Review',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 50),
          _boxTime(() {
            setState(() {
              isReply = !isReply;
            });
          }),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 100),
            child: _boxTime(() {
              setState(() {
                isReply = !isReply;
              });
            }),
          ),
          const SizedBox(height: 50),
          if (isReply)
            const TextField(
              decoration: InputDecoration(
                hintText: 'Input...',
                prefixIcon: Icon(Icons.input),
                border: OutlineInputBorder(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _boxTime(VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox.square(
                  dimension: 50, child: Icon(Icons.person_2_rounded)),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Richard Wilson",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Reviewed 2 Days ago",
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              SizedBox(
                width: 65,
              ),
              Expanded(
                  child: Row(
                children: [
                  Icon(
                    Icons.handshake_outlined,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "I recommend the doctor",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 65,
              ),
              Expanded(
                  child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sed dictum ligula, cursus blandit risus. Maecenas eget metus non tellus dignissim aliquam ut a ex. Maecenas sed vehicula dui, ac suscipit lacus",
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 65,
              ),
              Expanded(
                  child: GestureDetector(
                onTap: onTap,
                child: const Row(
                  children: [
                    Icon(
                      Icons.reply,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Reply",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
