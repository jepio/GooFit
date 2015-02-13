cu_srcs := $(wildcard PDFs/*.cu)
objects := $(cu_srcs:.cu=.o)

.PHONY: all clean
all: libGooPdf.so

libGooPdf.so: $(objects)
	nvcc -shared -arch=sm_20 $^ -o $@

PDFs/%.o: PDFs/%.cu
	nvcc -I. -IPDFs/ -O3 -Xcompiler -fPIC -arch=sm_20 -dc $< -o $@

clean: cmd += rm -rf $(objects) *.o libGooPdf.so
