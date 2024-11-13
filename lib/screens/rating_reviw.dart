import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

class RatingReview extends StatefulWidget {
  const RatingReview({super.key});

  @override
  State<RatingReview> createState() => _RatingReviewState();
}

class _RatingReviewState extends State<RatingReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Rating & Review"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    "Rating and Review  are verified and are from people who use the same type of device that you use.",
                    style: TextStyle(fontSize: 16)),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 4,
                      child: Text("4.8",
                          style: TextStyle(
                            fontSize: 60,
                          )),
                    ),
                    Expanded(
                        flex: 6,
                        child: Column(
                          children: [
                            ratingReview('5', 1),
                            ratingReview('4', 0.8),
                            ratingReview('3', 0.6),
                            ratingReview('2', 0.4),
                            ratingReview('1', 0.2),
                          ],
                        ))
                  ],
                ),
                RatingBarIndicator(
                    rating: 3,
                    itemSize: 17,
                    itemBuilder: (_, __) => Icon(
                          Icons.star_border_outlined,
                          color: Colors.yellow[400],
                        )),
                SizedBox(
                  height: 20,
                ),
                userReviewCard(),
                SizedBox(
                  height: 20,
                ),
                userReviewCard()
              ],
            ),
          ),
        ));
  }

  Widget ratingReview(String text, double value) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              text,
            )),
        Expanded(
            flex: 11,
            child: SizedBox(
              child: LinearProgressIndicator(
                value: value,
                minHeight: 11,
                backgroundColor: Colors.grey,
                borderRadius: BorderRadius.circular(7),
                valueColor: AlwaysStoppedAnimation(Colors.blue[400]),
              ),
            ))
      ],
    );
  }

  Widget userReviewCard() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/ellipse-3-bg.png"),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "John Due",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        children: [
          RatingBarIndicator(
              rating: 4,
              itemSize: 17,
              itemBuilder: (_, __) => Icon(
                    Icons.star_border_outlined,
                    color: Colors.blue[400],
                  )),
          const SizedBox(
            width: 20,
          ),
          const Text(
            "01 Nov, 2023",
            style: TextStyle(
              fontSize: 12,
            ),
          )
        ],
      ),
      SizedBox(
        height: 10,
      ),
      const ReadMoreText(
        'The user interface of the app is quite inuitiaive. I was able to navigate and make purchase seamlessly. Great Job!',
        trimCollapsedText: 'show more',
        trimExpandedText: 'show less',
        trimLines: 2,
        trimMode: TrimMode.Line,
        moreStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        lessStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 20),

      /// Company Review
      Container(
        height: 160,
        width: 700,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            // color: Theme.of(context).colorScheme.secondary,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.black
                : Colors.grey.shade300),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "T's Store",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 17),
                      ),
                      Text(
                        '02 Nov, 2023',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ReadMoreText(
                    'The user interface of the app is quite inuitiaive. I was able to navigate and make purchase seamlessly. Great Job!',
                    trimCollapsedText: 'show more',
                    trimExpandedText: 'show less',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    ]);
  }
}
