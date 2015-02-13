cu_srcs := $(wildcard *.cu)
objects := $(cu_srcs:.cu=.o)

.PHONY: all clean
all: libGooPdf.so

libGooPdf.so: $(objects)
	nvcc -shared -arch=sm_20 $^ -o $@

%.o: %.cu
	nvcc -I.. -O3 -Xcompiler -fPIC -arch=sm_20 -dc $< -o $@

clean:
	@rm -rf $(objects) libGooPdf.so
