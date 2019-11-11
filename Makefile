all: build run

build:
	mkdir build && cd build && cmake -G "MinGW Makefiles" ./../ && make

run:
	cd build && main.exe
	
clean:
	rmdir /S /Q build