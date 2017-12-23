#!/bin/bash
#export PATH=/home/pi/ultibo/core/fpc/bin:$PATH
rm -f *.o
rm -f libklt.a
rm -f kernel7.img

make -f MakefileUltibo
arm-none-eabi-gcc -c ultibo_example1.c -DULTIBO -O3 -mabi=aapcs -marm -march=armv7-a -mfpu=vfpv3-d16 -mfloat-abi=hard -lklt
arm-none-eabi-ar ruv libklt.a ultibo_example1.o
#gcc test_svd.c svd.o disp_mat.o -lm -o test_svd
arm-none-eabi-ar -t libklt.a > libklt_obj.txt
fpc -vi -B -Tultibo -Parm -CpARMV7A -WpRPI2B @/home/pi/ultibo/core/fpc/bin/RPI2.CFG -O4 KLT_RPi2.lpr
