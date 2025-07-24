// import 'package:flutter/material.dart';

// class Calculator extends StatelessWidget {
//   const Calculator({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [Expanded(child: Text("Hello"))],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(child: ElevatedButton(onPressed: null, child: Text("MC"))),
//           ],
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20.0),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Expanded(child: Text("Hello World!"))],
          ),
          Row1(),
          Row2(),
          Row2(),
          Row2(),
          Row2(),
          Row2(),
          Row2(),
        ],
      ),
    );
  }
}

class Row1 extends StatelessWidget {
  const Row1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: ElevatedButton(onPressed: null, child: Text("MC"))),
        Expanded(child: ElevatedButton(onPressed: null, child: Text("MR"))),
        Expanded(child: ElevatedButton(onPressed: null, child: Text("M+"))),
        Expanded(child: ElevatedButton(onPressed: null, child: Text("M-"))),
        Expanded(child: ElevatedButton(onPressed: null, child: Text("Ms"))),
        Expanded(child: ElevatedButton(onPressed: null, child: Text("MC"))),
      ],
    );
  }
}

class Row2 extends StatelessWidget {
  const Row2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: ElevatedButton(onPressed: null, child: Text("1"))),
        Expanded(child: ElevatedButton(onPressed: null, child: Text("2"))),
        Expanded(child: ElevatedButton(onPressed: null, child: Text("3"))),
        Expanded(child: ElevatedButton(onPressed: null, child: Text("4"))),
      ],
    );
  }
}
