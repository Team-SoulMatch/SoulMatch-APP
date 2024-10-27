import 'package:flutter/material.dart';

class ProvideSelfAlert extends StatelessWidget {
  const ProvideSelfAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 70, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.error,
            color: Colors.red,
            size: 40,
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              '이 정보는 매칭 알고리즘에만 사용되고 다른 용도로 사용되지 않아요.',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
