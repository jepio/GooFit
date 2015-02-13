cu_srcs := $(wildcard PDFs/*.cu)
pdf_objs := $(cu_srcs:.cu=.o)

.PHONY: all clean
all: libGooPdf.so

libGooPdf.so: $(pdf_objs)
	nvcc -shared -arch=sm_20 $^ -o $@

PDFs/%.o: PDFs/%.cu
	nvcc -I. -IPDFs/ -O3 -Xcompiler -fPIC -arch=sm_20 -dc $< -o $@

clean: cmd += rm -rf $(pdf_objs) *.o libGooPdf.so
