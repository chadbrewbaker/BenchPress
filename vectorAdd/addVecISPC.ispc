export void addVec(uniform int vin[], uniform int vin2[], uniform int vout[], 
                   uniform int count) {
    foreach (index = 0 ... count) {
        // computation dependent on the value being processed
         int v = vin[index]+vin2[index];
        // And write the result to the output array.
        vout[index] = v;
    }
}
