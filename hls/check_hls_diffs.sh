#!/bin/bash
for f in ../../test-vectors/*sv*.dat;
 do make c_test TEST="$f"
done
