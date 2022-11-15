import spiceypy as spice
import numpy as np

spice.furnsh('../rosetta_kernel.tm')

et_start = spice.str2et('2016 MAR 2 12:00:00')
et_end   = spice.str2et('2016 MAR 4 12:00:00')

ets = np.linspace(et_start, et_end, num=10)

positions,_ = spice.spkpos('ROSETTA',ets,'67P/C-G_CK','NONE','CHURYUMOV-GERASIMENKO')

print('Positions of Rosetta:')
print(positions)