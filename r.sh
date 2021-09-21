#*****************************************************************************************************************************
# Program name: "Find_Circumference".  This program allow the user to input the radius of a circle and find out its          *
# circumfrence in both decimal and hexadecimal. Inputs with decimal values can be computed  Copyright (C) 2020 AJ Albrecht   *
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
# version 3 as published by the Free Software Foundation.                                                                    *
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
# Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
# A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
#*****************************************************************************************************************************
#=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
#
#Author information
#Author name: AJ Albrecht
#Author email: ajalbrecht@fullerton.edu
#
#Program information
#  Program name: Least_to_Greatest
#  Programming languages: C, x86 Assembly and Bash
#  Date program began:     2020-Oct-29
#  Date program completed: 2020-Nov-7
#  Date comments upgraded: 2020-Nov-7
#  Files in this program: r.sh circumference.c circle.ams
#  Status: Complete. No bugs found after testing.
#
#References for this program
#  Albrecht, What_Is_The_Sum, version 1
#  Albrecht, Least_to_Greatest, version 1
#  Holiday, Floating Io, version 1.
#  Holiday, numbers4scientists, version 1
#
#Purpose
#  Compute the circumference of a circle while also providing its circumference in hexadecimal.
#
#This file
#   File name: r.sh
#   Language: bash
#   Max page width: 132 columns
#   Assemble: ./Find_Circumference.out
#   Link: g++ -m64 -no-pie -o Find_Circumference.out -std=c17 circumfrence.o circle.o
#   Optimal print specification: 132 columns width, 7 points, monospace, 8½x11 paper
#
#Purpose of this file
#   Compile the program togeather.

#!/bin/bash

# Compile all individual filles togeather.
# The order of compelation is based on which file is needed first.
gcc -c -Wall -m64 -no-pie -o circumfrence.o circumfrence.c -std=c17
nasm -f elf64 -l circle.lis -o circle.o circle.asm

# Assemble files togeather
g++ -m64 -no-pie -o Find_Circumference.out -std=c17 circumfrence.o circle.o

#Run the program
./Find_Circumference.out
