#!/bin/bash
#export PATH=/home/pi/ultibo/core/fpc/bin:$PATH
rm -f *.o
rm -f libsvd.a

arm-none-eabi-gcc  -O3 -mabi=aapcs -marm -march=armv7-a -mfpu=vfpv3-d16 -mfloat-abi=hard -c svd.c -o svd.o
arm-none-eabi-gcc  -O3 -mabi=aapcs -marm -march=armv7-a -mfpu=vfpv3-d16 -mfloat-abi=hard -c disp_mat.c -o disp_mat.o
arm-none-eabi-gcc  -O3 -mabi=aapcs -marm -march=armv7-a -mfpu=vfpv3-d16 -mfloat-abi=hard -c ultibo_svd.c -o ultibo_svd.o
#gcc test_svd.c svd.o disp_mat.o -lm -o test_svd
arm-none-eabi-ar rcs libsvd.a *.o
arm-none-eabi-ar -t libsvd.a > libsvd_obj.txt
fpc -vi -B -Tultibo -Parm -CpARMV7A -WpRPI2B @/home/pi/ultibo/core/fpc/bin/RPI2.CFG -O4 SVD_RPi2.lpr
