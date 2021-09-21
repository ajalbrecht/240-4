//*****************************************************************************************************************************
// Program name: "Find_Circumference".  This program allow the user to input the radius of a circle and find out its          *
// circumfrence in both decimal and hexadecimal. Inputs with decimal values can be computed  Copyright (C) 2020 AJ Albrecht   *
// This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
// version 3 as published by the Free Software Foundation.                                                                    *
// This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
// Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
// A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
//*****************************************************************************************************************************
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//Author information
//Author name: AJ Albrecht
//Author email: ajalbrecht@fullerton.edu
//
//Program information
//  Program name: Least_to_Greatest
//  Programming languages: C, x86 Assembly and Bash
//  Date program began:     2020-Oct-29
//  Date program completed: 2020-Nov-7
//  Date comments upgraded: 2020-Nov-7
//  Files in this program: r.sh circumference.c circle.ams
//  Status: Complete. No bugs found after testing.
//
//References for this program
//  Albrecht, What_Is_The_Sum, version 1
//  Albrecht, Least_to_Greatest, version 1
//  Holiday, Floating Io, version 1.
//  Holiday, numbers4scientists, version 1
//
//Purpose
//  Compute the circumference of a circle while also providing its circumference in hexadecimal.
//
//This file
//   File name: circumfrence.c
//   Language: C
//   Max page width: 132 columns
//   Assemble: gcc -c -Wall -m64 -no-pie -o circumfrence.o circumfrence.c -std=c17
//   Link: g++ -m64 -no-pie -o Find_Circumference.out -std=c17 circumfrence.o circle.o
//   Optimal print specification: 132 columns width, 7 points, monospace, 8½x11 paper
//
//Purpose of this file
//   Act as prgram driver and compute the hex value after calling circle.asm.

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

extern double circle();

int main() {
  // Initialize pointer varivles.
  double* decimal = malloc(1*sizeof(double));
  void* temp;
  unsigned long *hex;

  // Inroduce the user to the program.
  printf("%s\n", "Welcome to your friendly circle circumference calculator.");
  printf("%s\n", "The main program will now call the circle function.");

  // Call asm file to get the result.
  *decimal = circle();

  // Use the resulte from the asm file to computer the hex result.
  temp = decimal;
  hex = temp;

  // Display the decimal and hex cicumfrence calues and end the program.
  printf("The main received this number:   %4.16lf = 0x%016lx\n", *decimal, *hex);
  printf("%s\n", "Have a nice day.  Main will now return 0 to the operating system.");

  return 0;
}
