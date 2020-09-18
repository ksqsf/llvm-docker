# Build LLVM+Clang
cd /
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.1/llvm-project-10.0.1.tar.xz
tar xJvf llvm-project-10.0.1.tar.xz -C /
rm llvm-project-10.0.1.tar.xz
mv llvm-project-* llvm-src
mkdir -p /llvm /llvm-build

cd /llvm-build
cmake  -DLLVM_ENABLE_PROJECTS="clang" -DCMAKE_BUILD_TYPE=Release  -DCMAKE_INSTALL_PREFIX=/llvm /llvm-src/llvm
make -j10

mkdir -p /llvm
make install
