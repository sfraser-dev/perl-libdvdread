# Had to move reference to -ldl (shared library for dynamic libraries) to the end of the command in the *Makefile*.
# Run configure2, make, make install again to have the proper reference to the DL library.
gcc -Wall -o test1.exe test1.c -I/usr/local/include/dvdread -L/usr/lib/i386-linux-gnu -L/usr/local/lib -ldvdread -ldl
