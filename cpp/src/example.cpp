#include <iostream>
#include <vector>
#include <iostream>

#include "SpiceUsr.h"

using Scalar = float;

int main(){

    std::cout << "Hello SPICE!\n";

    // Furnsh all spice kernels:
    furnsh_c("../rosetta_kernel.tm");

    // Get the ephemeris times:
    #define TIMSIZ 64;
    double et_start;
    double et_end;
    char timestr[] = "2016 MAR 2 12:00:00";
    str2et_c(timestr,&et_start);
    char timestr2[] = "2016 MAR 4 12:00:00";
    str2et_c(timestr2,&et_end);

    double num = 10;
    auto span = et_end - et_start;
    auto dt = span/num;

    std::cout << "Positions of Rosetta:\n";
    for (double et = et_start; et < et_end; et=et+dt){
        double pos[3];
        double lt;

        // Calculate new poses:
        spkpos_c( "ROSETTA", et, "67P/C-G_CK",  "NONE", "CHURYUMOV-GERASIMENKO",  pos,  &lt);
        std::cout << pos[0] <<", "<<pos[1]<<", "<<pos[2]<<"\n";
    }
}
