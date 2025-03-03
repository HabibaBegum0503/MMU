/******************************************************************************

Welcome to GDB Online.
GDB online is an online compiler and debugger tool for C, C++, Python, Java, PHP, Ruby, Perl,
C#, OCaml, VB, Swift, Pascal, Fortran, Haskell, Objective-C, Assembly, HTML, CSS, JS, SQLite, Prolog.
Code, Compile, Run and Debug online from anywhere in world.

*******************************************************************************/

    //Program 2: To read data from the standard input device and write it on the screen 

//read.c
#include<unistd.h>
int
main ()
{
  char buff[20];
  read (0, buff, 10);		//read 10 bytes from standard input device(keyboard), store in buffer (buff)
  write (1, buff, 10);		//print 10 bytes from the buffer on the screen
}
}
