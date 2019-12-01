#gameboy programming 
Learning programming with a gameboy console

#building visualboyadvance-m emulator for linux
cd ~ && mkdir src && cd src
git clone https://github.com/visualboyadvance-m/visualboyadvance-m.git
cd visualboyadvance-m
./installdeps

# ./installdeps will give you build instructions, which will be similar to:

mkdir build && cd build
cmake ..
make -j`nproc`
