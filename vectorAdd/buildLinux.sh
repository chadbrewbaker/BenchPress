../ispc addVecISPC.ispc -h addVecISPC.h -o addVecISPC.o -O3 --target=host
clang-3.9 -shared -o addVecISPC.so addVecISPC.o -O3
clang-3.9 -shared -o addVec.so addVec.c -O3
clang-3.9 -shared -o addVec0.so addVec.c -O0
clang-3.9 addVecDriver.c -Wall -O3 -o addVecDriver -ldl
echo "ls -la"
ls -la

echo "C -O3 addVec"
time ./addVecDriver
echo "C -O0 addVec"
cp addVec0.so addVec.so
time ./addVecDriver

echo "ISPC addVec"
cp addVecISPC.so addVec.so
time ./addVecDriver
