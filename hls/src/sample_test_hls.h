#ifndef SAMPLE_TEST_HLS
#define SAMPLE_TEST_HLS
#include "rast_types_hls.h"

#pragma hls_design
class SampleTest{
public:
    SampleTest(){}

    #pragma hls_design interface ccore
    bool CCS_BLOCK(run)(TriangleHLS triangle, SampleHLS sample)
    {
        bool isHit;
        // START CODE HERE
        typedef ac_int<SIG_FIG*2, true> MultSignedFixedPoint;
        SignedFixedPoint v0_x = triangle.v[0].x - sample.x;
        SignedFixedPoint v0_y = triangle.v[0].y - sample.y;
        SignedFixedPoint v1_x = triangle.v[1].x - sample.x;
        SignedFixedPoint v1_y = triangle.v[1].y - sample.y;
        SignedFixedPoint v2_x = triangle.v[2].x - sample.x;
        SignedFixedPoint v2_y = triangle.v[2].y - sample.y;
        MultSignedFixedPoint dist0 = v0_x * v1_y - v1_x * v0_y;
        MultSignedFixedPoint dist1 = v1_x * v2_y - v2_x * v1_y;
        MultSignedFixedPoint dist2 = v2_x * v0_y - v0_x * v2_y;

        bool b0 = dist0 <= 0;
        bool b1 = dist1 < 0;
        bool b2 = dist2 <= 0;

        isHit = b0 && b1 && b2;
        // END CODE HERE
        return isHit;
    }
};

#endif
