#! /bin/csh -f
setenv SYSTEMC_HOME /cad/mentor/2019.11/Catapult_Synthesis_10.4b-841621/Mgc_home/shared
setenv SYSTEMC_LIB_DIR /cad/mentor/2019.11/Catapult_Synthesis_10.4b-841621/Mgc_home/shared/lib
setenv CXX_FLAGS "-g -DCALYPTO_SKIP_SYSTEMC_VERSION_CHECK"
setenv LD_FLAGS "-lpthread"
setenv OSSIM ddd
setenv PATH /cad/mentor/2019.11/Catapult_Synthesis_10.4b-841621/Mgc_home/bin:$PATH
