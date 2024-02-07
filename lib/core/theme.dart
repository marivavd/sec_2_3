import 'package:flutter/material.dart';


var lightTheme = ThemeData(
  textTheme: const TextTheme(
    labelLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Color.fromARGB(255, 58, 58, 58),
      fontFamily: 'Roboto'
    ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 167, 167, 167),
        fontFamily: 'Roboto'
    ),
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 167, 167, 167),
        fontFamily: 'Roboto'),
      titleSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 167, 167, 167),
          fontFamily: 'Roboto'
      ),
    titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 167, 167, 167),
          fontFamily: 'Roboto'
      ),
    titleLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          fontFamily: 'Roboto',
          color: Colors.white
      ),
    bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 5, 96, 250),
        fontFamily: 'Roboto'
    )

  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 5, 96, 250),
        disabledBackgroundColor: Color.fromARGB(255, 167, 167, 167),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)
        )
    )
  )
);
var darkTheme = ThemeData(
  textTheme: const TextTheme(
  labelLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Color.fromARGB(255, 58, 58, 58),
      fontFamily: 'Roboto'
  ),
  labelMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Color.fromARGB(255, 167, 167, 167),
      fontFamily: 'Roboto'
  ),
  labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Color.fromARGB(255, 167, 167, 167),
      fontFamily: 'Roboto'),
  titleSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 167, 167, 167),
      fontFamily: 'Roboto'
  ),
  titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto',
      color: Colors.white
  ),
)
);
