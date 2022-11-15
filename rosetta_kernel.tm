KPL/MK
\begindata

    PATH_VALUES       = ( '../kernels/generic_kernels',
                          '../kernels/rosetta_kernels' )

    PATH_SYMBOLS      = ( 'GENERIC',
                          'ROSETTA' )

    KERNELS_TO_LOAD   = (
                         '$GENERIC/lsk/naif0012.tls',
                         '$ROSETTA/ck/CATT_DV_257_03_______00344.BC',
                         '$ROSETTA/ck/ROS_SC_REC_160101_160601_V01.BC',
                         '$ROSETTA/fk/ROS_CHURYUMOV_V01.TF',
                         '$ROSETTA/fk/ROS_V37.TF',
                         '$ROSETTA/sclk/ROS_160929_STEP.TSC',
                         '$ROSETTA/spk/RORB_DV_257_02_______00344.BSP',
                         '$ROSETTA/spk/CORB_DV_257_02_______00344.BSP'
                         )

\begintext
    Meta-Kernels allow you to specify multiple kernels to be used at once.  This is especially useful when
    you have several projects which share kernels.  This particular meta kernel file specifies kernels for
    the ROSETTA mission, specifically for the ROSETTA spacecraft and Comet 67P over the over a period from
    01/01/2016 to 06/01/2016.
    
    Further reading on meta-kernels (and kernels in general) can be found at: 
    https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/req/kernel.html


End of MK file.