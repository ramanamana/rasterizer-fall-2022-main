#ifndef BOUNDING_BOX_HLS
#define BOUNDING_BOX_HLS

#include "rast_types_hls.h"

#pragma hls_design 
class BoundingBoxGenerator{
public:
    BoundingBoxGenerator() {}

    #pragma hls_design interface
    void CCS_BLOCK(run)(
        ac_channel<TriangleHLS> &triangle_in, 
        ac_channel<ScreenHLS> &screen_in, 
        ac_channel<ConfigHLS> &config_in,
        ac_channel<BoundingBoxHLS> &bbox_out,
        ac_channel<TriangleHLS> &triangle_out,
        ac_channel<ConfigHLS> &config_out
    ){
        #ifndef __SYNTHESIS__
        while(triangle_in.available(1))
        #endif
        {
            TriangleHLS triangle = triangle_in.read();
            ScreenHLS screen = screen_in.read();
            ConfigHLS config = config_in.read();

            BoundingBoxHLS bbox;
            
            // START CODE HERE
            // iterate over remaining vertices
            bbox.lower_left.x = triangle.v[0].x;
            bbox.lower_left.y = triangle.v[0].y;
            bbox.upper_right.x = triangle.v[0].x;
            bbox.upper_right.y = triangle.v[0].y;
            for(int i = 1; i < 3; i++){
            if(triangle.v[i].x < bbox.lower_left.x){
                bbox.lower_left.x = triangle.v[i].x;
            }
            if(triangle.v[i].y < bbox.lower_left.y){
                bbox.lower_left.y = triangle.v[i].y;
            }
            if(triangle.v[i].x > bbox.upper_right.x){
                bbox.upper_right.x = triangle.v[i].x;
            }
            if(triangle.v[i].y > bbox.upper_right.y){
                bbox.upper_right.y = triangle.v[i].y;
            }
  }
            // round down to subsample grid
            bbox.upper_right.x = floor_ss(bbox.upper_right.x, config);
            bbox.upper_right.y = floor_ss(bbox.upper_right.y, config);
            bbox.lower_left.x = floor_ss(bbox.lower_left.x, config);
            bbox.lower_left.y = floor_ss(bbox.lower_left.y, config);
            // clip to screen
            bbox.upper_right.x = min(bbox.upper_right.x, screen.width);
            bbox.upper_right.y = min(bbox.upper_right.y, screen.height);
            bbox.lower_left.x = max(bbox.lower_left.x, 0);
            bbox.lower_left.y = max(bbox.lower_left.y, 0);
            // check if bbox is valid
            bool valid;
            valid = (bbox.upper_right.x >= 0) && (bbox.upper_right.y >= 0) && (bbox.lower_left.x < screen.width ) && (bbox.lower_left.y < screen.height);
            // write to outputs if bbox is valid
            if (valid) {
                bbox_out.write(bbox);
                triangle_out.write(triangle);
                config_out.write(config);
            }
            // END CODE HERE
        }
    }
private:
    SignedFixedPoint min(SignedFixedPoint a, SignedFixedPoint b)
    {
        // START CODE HERE
        if(a > b){ 
            return b;
        }else{
            return a;
        }
        // END CODE HERE
    }

    SignedFixedPoint max(SignedFixedPoint a, SignedFixedPoint b)
    {
        // START CODE HERE
        if(a > b){
            return a;
        }else{
            return b;
        }
        // END CODE HERE
    }

    SignedFixedPoint floor_ss(SignedFixedPoint val, ConfigHLS config)
    {
        // START CODE HERE
        // set lower 8 bits to 0
        val.set_slc(0, (ac_int<RADIX-3,false>)0b0000000);
        // set bits depending on subsample
        switch(config.subsample) {
            case 1:
                break;
            case 2:
                val.set_slc(RADIX-3, (ac_int<1,false>)0b0);
                break;
            case 4:
                val.set_slc(RADIX-3, (ac_int<2,false>)0b00);
                break;
            case 8:
                val.set_slc(RADIX-3, (ac_int<3,false>)0b000);
                break;
        }
        // END CODE HERE
        return val;
    }
};

#endif
