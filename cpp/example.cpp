#include <iostream>
#include <vector>
#include <iostream>

#include "cspice/include/SpiceUsr.h"

using Scalar = float;

int main(){

    std::cout << "Hello SPICE!\n";

    // Furnsh all spice kernels:
    furnsh_c("../rosetta_kernel.tm");

    // Get the ephemeris times:
    double et_start;
    double et_end;
    #define  MAXIV  1000
    #define  WINSIZ ( 2 * MAXIV )
    SPICEDOUBLE_CELL( cover, WINSIZ );
    spkcov_c ( "../../kernels/CAESAR_TAG.bsp", -123, &cover );
    wnfetd_c ( &cover, 0, &et_start, &et_end );
    double dt = 30; // Time step size

    // Declare SPICE variables:
    double pos[3];
    double pos_s[3];
    double rotate[3][3];
    double lt;
    uint idx = 0;
    for (double et = et_start+120; et < et_end; et=et+dt){
        // Calculate new poses:
        spkpos_c( "-123", et, "IAU_CG",  "NONE", "CG",  pos,  &lt);
        spkpos_c( "SUN", et, "IAU_CG",  "NONE", "CG",  pos_s,  &lt);
        pxform_c("CK_CAESAR","IAU_CG", et, rotate);
        // std::cout << pos[0] <<", "<<pos[1]<<", "<<pos[2]<<"\n";
        // std::cout << pos_s[0] <<", "<<pos_s[1]<<", "<<pos_s[2]<<"\n";
        // std::cout << rotate[2][0]<<", "<<rotate[2][1]<<", "<<rotate[2][2]<<"\n";

        // Cast rotation matrix from float to double:
        Scalar pos_f[3];
        Scalar pos_s_f[3];
        Scalar rotate_f[3][3];
        for (int i = 0; i < 3; i++){
            for (int j = 0; j < 3; j++){
                rotate_f[i][j] = (Scalar) rotate[i][j];
            }
            pos_f[i] = (Scalar) pos[i];
            pos_s_f[i] = (Scalar) pos_s[i]/100;
        }
        idx++;
        break;
    }
}
