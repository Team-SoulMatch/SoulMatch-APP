import 'package:flutter/material.dart';
import 'package:soul_match/models/volunteer.dart';
import 'package:soul_match/pages/components/route_animation.dart';
import 'package:soul_match/pages/detail.dart';

class ListItem extends StatelessWidget {
  final Volunteer data;

  const ListItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(12.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  data.imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover
                )
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: const TextStyle(
                        fontSize: 16
                      )
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        data.location,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600]
                        )
                      ),
                    )
                  ]
                )
              )
            ]
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: (){
                    PageRouteWithAnimation route = PageRouteWithAnimation(Detail(volunteer: data));
                    Navigator.push(
                        context,
                        route.slideRightToLeft()
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFF535353),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    side: BorderSide.none,
                  ),
                  child: const Text(
                    '상세보기',
                    style: TextStyle(color: Colors.white),
                  )
                )
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF74526),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8)
                  ),
                  child: const Text(
                    '지원하기',
                    style: TextStyle(color: Colors.white)
                  )
                )
              )
            ]
          )
        ]
      )
    );
  }
}
