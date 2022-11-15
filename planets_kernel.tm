KPL/MK
\begindata

    PATH_VALUES       = ( '../kernels/generic_kernels' )

    PATH_SYMBOLS      = ( 'GENERIC' )

    KERNELS_TO_LOAD   = (
                         '$GENERIC/lsk/naif0012.tls',
                         '$GENERIC/pck/Gravity.tpc',
                         '$GENERIC/pck/pck00010.tpc',
                         '$GENERIC/spk/de430.bsp'
                         )

\begintext
    Meta-Kernels allow you to specify multiple kernels to be used at once.  This is especially useful when
    you have several projects which share kernels.  This particular meta kernel specifies only a set of 
    generic kernels used for determining information about the planets.
    
    Further reading on meta-kernels (and kernels in general) can be found at: 
    https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/req/kernel.html


End of MK file.