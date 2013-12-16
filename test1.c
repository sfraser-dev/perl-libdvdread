#include<stdio.h>
#include<dvd_reader.h>
#include<dlfcn.h>
#include<ifo_types.h>
#include<bitreader.h>
#include<dvd_udf.h>
#include<ifo_print.h>
#include<ifo_read.h>
#include<nav_print.h>
#include<nav_read.h>
#include<nav_types.h>
int main() {
    printf("hwwehdfwej\n");
    dvd_reader_t *dvd_p;
    ifo_handle_t *ifo_p;

    //dvd_p = DVDOpen("/home/stewart/dev/libdvdread/test/dvdflick4_1_to_1_smallSample/dvd/VIDEO_TS/");
    //dvd_p = DVDOpen("/home/stewart/dev/libdvdread/test/dvdflick4_1_to_3_smallSample/dvd/VIDEO_TS/");
    dvd_p = DVDOpen("/home/stewart/dev/libdvdread/OTSL_DVD_orig/VIDEO_TS/");
    ifo_p = ifoOpen(dvd_p,0);

    //ifoRead_PGCI_UT(ifo_p);
    ifo_print(dvd_p, 0);

    ifoClose(ifo_p);
    DVDClose(dvd_p);

    return 0;
}
