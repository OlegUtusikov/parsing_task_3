all: build run

build:
	mkdir build && cd build && cmake  ./../ && make

run:
	cd build && main.exe
	
clean:
	rm -rf ./build
