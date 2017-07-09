ispc addVecISPC.ispc -h addVecISPC.h -o addVecISPC.o -O3 --target=host
clang -shared -o addVecISPC.dylib addVecISPC.o -O3
clang -shared -o addVec.dylib addVec.c -O3
clang -shared -o addVec0.dylib addVec.c -O0
clang addVecDriver.c -Wall -O3 -o addVecDriver
echo "C -O3 addVec"
time ./addVecDriver
echo "C -O0 addVec"
cp addVec0.dylib addVec.dylib
time ./addVecDriver

echo "ISPC addVec"
cp addVecISPC.dylib addVec.dylib
time ./addVecDriver
