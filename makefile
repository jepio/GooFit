srcs := $(wildcard *.cc)
managers := $(wildcard FitManagerMinuit?.cc)
managers := $(managers:.cc=.o)
common_objs := $(srcs:.cc=.o)
common_objs := $(filter-out $(managers) GenVoigtian.o,$(common_objs)) 


.PHONY: all goofit clean
goofit: libGoofit.so

all: libGooCommon.so 

%.o: %.cc %.hh
	nvcc -O3 -Xcompiler -fPIC -IPDFs/ -I. -Irootstuff -c $< -o $@

libGooCommon.so: $(common_objs)
	nvcc -shared $^ -o $@

include rootstuff/Makefile
include PDFs/makefile

clean: cmd += rm -rf $(common_objs) libGooCommon.so libGoofit.so
clean:
	$(cmd)

libGoofit.so: $(pdf_objs) $(common_objs) $(root_objs)
	nvcc -shared $^ -o $@
