import 'package:flutter/material.dart';

// // Страница "Время работы"
// Widget contentClock() {
//   return Container(
//     height: double.infinity,
//     color: Color.fromARGB(255, 17, 17, 17),
//     child: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             'Время работы',
//             style: TextStyle(
//               color: Color.fromARGB(255, 255, 255, 255),
//               fontFamily: 'Montserrat',
//               fontWeight: FontWeight.w500,
//               fontSize: 20, // 14
//             ),
//           ),
//           Text(
//             'Время работы',
//             style: TextStyle(
//               color: Color.fromARGB(255, 255, 255, 255),
//               fontFamily: 'Montserrat',
//               fontWeight: FontWeight.w100,
//               fontSize: 20, // 14
//             ),
//           ),
//           Text(
//             'Время работы',
//             style: TextStyle(
//               color: Color.fromARGB(255, 255, 255, 255),
//               fontFamily: 'Montserrat',
//               fontWeight: FontWeight.w200,
//               fontSize: 20, // 14
//             ),
//           ),
//           Text(
//             'Время работы',
//             style: TextStyle(
//               color: Color.fromARGB(255, 255, 255, 255),
//               fontFamily: 'Montserrat',
//               fontWeight: FontWeight.w300,
//               fontSize: 20, // 14
//             ),
//           ),
//           Text(
//             'Время работы',
//             style: TextStyle(
//               color: Color.fromARGB(255, 255, 255, 255),
//               fontFamily: 'Montserrat',
//               fontWeight: FontWeight.w400,
//               fontSize: 20, // 14
//             ),
//           ),
//           Text(
//             'Время работы',
//             style: TextStyle(
//               color: Color.fromARGB(255, 255, 255, 255),
//               fontFamily: 'Montserrat',
//               fontWeight: FontWeight.w500,
//               fontSize: 20, // 14
//             ),
//           ),
//           Text(
//             'Время работы',
//             style: TextStyle(
//               color: Color.fromARGB(255, 255, 255, 255),
//               fontFamily: 'Montserrat',
//               fontWeight: FontWeight.w600,
//               fontSize: 20, // 14
//             ),
//           ),
//           Text(
//             'Время работы',
//             style: TextStyle(
//               color: Color.fromARGB(255, 255, 255, 255),
//               fontFamily: 'Montserrat',
//               fontWeight: FontWeight.w700,
//               fontSize: 20, // 14
//             ),
//           ),
//           Text(
//             'Время работы',
//             style: TextStyle(
//               color: Color.fromARGB(255, 255, 255, 255),
//               fontFamily: 'Montserrat',
//               fontWeight: FontWeight.w800,
//               fontSize: 20, // 14
//             ),
//           ),
//           Text(
//             'Время работы',
//             style: TextStyle(
//               color: Color.fromARGB(255, 255, 255, 255),
//               fontFamily: 'Montserrat',
//               fontWeight: FontWeight.w900,
//               fontSize: 20, // 14
//             ),
//           ),
//           SizedBox(height: 50),
//           // Таблица

//           Row(
//             mainAxisSize: MainAxisSize.min,
//             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               // День недели
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'ПН',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 255, 255, 255),
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 15, // 14
//                     ),
//                   ),
//                   Text(
//                     'ВТ',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 255, 255, 255),
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 15, // 14
//                     ),
//                   ),
//                   Text(
//                     'СР',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 255, 255, 255),
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 15, // 14
//                     ),
//                   ),
//                   Text(
//                     'ЧТ',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 255, 255, 255),
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 15, // 14
//                     ),
//                   ),
//                   Text(
//                     'ПТ',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 255, 255, 255),
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 15, // 14
//                     ),
//                   ),
//                   Text(
//                     'СБ',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 255, 255, 255),
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 15, // 14
//                     ),
//                   ),
//                   Text(
//                     'ВС',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 255, 255, 255),
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 15, // 14
//                     ),
//                   ),
//                 ],
//               ),
//               // Время
//               Column(
//                 children: [
//                   Text(
//                     '   с 12:00 до 02:00  ',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 255, 255, 255),
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 15, // 14
//                     ),
//                   ),
//                   Text(
//                     '   с 12:00 до 02:00  ',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 255, 255, 255),
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 15, // 14
//                     ),
//                   ),
//                   Text(
//                     '   с 12:00 до 02:00  ',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 255, 255, 255),
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 15, // 14
//                     ),
//                   ),
//                   Text(
//                     '   с 12:00 до 02:00  ',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 255, 255, 255),
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 15, // 14
//                     ),
//                   ),
//                   Text(
//                     '   с 12:00 до 04:00  ',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 255, 255, 255),
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 15, // 14
//                     ),
//                   ),
//                   Text(
//                     '   с 16:00 до 04:00  ',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 255, 255, 255),
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 15, // 14
//                     ),
//                   ),
//                   Text(
//                     '   с 16:00 до 02:00  ',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 255, 255, 255),
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 15, // 14
//                     ),
//                   ),
//                 ],
//               ),
//               // До последнего гостя
//               Column(
//                 children: [
//                   Text(
//                     'или\nдо\nпоследнего\nгостя',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 255, 255, 255),
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 15, // 14
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//       // child: Text(
//       //   'Время работы',
//       //   style: TextStyle(
//       //     color: Color.fromARGB(177, 255, 255, 255),
//       //     fontFamily: 'Montserrat',
//       //     fontWeight: FontWeight.w500,
//       //     fontSize: 40, // 14
//       //   ),
//       // ),
//     ),
//   );
// }

Widget contentClock() {
  return Container(
    height: double.infinity,
    color: Color.fromARGB(255, 17, 17, 17),
    child: Column(
      children: [
        Expanded(
          flex: 3,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                child: FadeInImage(
                  fadeInDuration: Duration(milliseconds: 250),
                  image: AssetImage(
                    'assets/images/cover.png', // Логотип
                  ),
                  placeholder: AssetImage(
                    'assets/images/logo_zaglushka.png', // Прозрачная заглушка
                  ),
                  // alignment: Alignment.c,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.0, 1.0),
                    end: Alignment(0.0, 0.6),
                    colors: [
                      const Color.fromARGB(255, 17, 17, 17),
                      const Color.fromARGB(150, 17, 17, 17),
                      const Color.fromARGB(50, 17, 17, 17),
                      const Color.fromARGB(0, 17, 17, 17)
                    ], // red to yellow
                  ),
                ),
              ),
            ],
          ),
        ),
        // Expanded(
        //   // flex: 4,
        //   child:
        Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // День недели
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textStyle('ПН'),
                        SizedBox(height: 6),
                        textStyle('ВТ'),
                        SizedBox(height: 6),
                        textStyle('СР'),
                        SizedBox(height: 6),
                        textStyle('ЧТ'),
                        SizedBox(height: 6),
                        textStyle('ПТ'),
                        SizedBox(height: 6),
                        textStyle('СБ'),
                        SizedBox(height: 6),
                        textStyle('ВС'),
                        SizedBox(height: 6),
                      ],
                    ),
                    // Время
                    Column(
                      children: [
                        textStyle('   с 12:00 до 02:00  '),
                        SizedBox(height: 6),
                        textStyle('   с 12:00 до 02:00  '),
                        SizedBox(height: 6),
                        textStyle('   с 12:00 до 02:00  '),
                        SizedBox(height: 6),
                        textStyle('   с 12:00 до 02:00  '),
                        SizedBox(height: 6),
                        textStyle('   с 12:00 до 04:00  '),
                        SizedBox(height: 6),
                        textStyle('   с 16:00 до 04:00  '),
                        SizedBox(height: 6),
                        textStyle('   с 16:00 до 02:00  '),
                        SizedBox(height: 6),
                      ],
                    ),
                  ],
                ),
                // До последнего гостя
                Column(
                  children: [
                    SizedBox(height: 18),
                    textStyle('( или до последнего гостя )'),
                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ),
        // ),
        SizedBox(height: 20),
      ],
    ),
  );
}

Widget textStyle(String value) {
  return Text(
    value,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 15, // 14
    ),
  );
}
