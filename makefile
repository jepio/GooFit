srcs := $(wildcard *.cc)
managers := $(wildcard FitManagerMinuit?.cc)
managers := $(managers:.cc=.o)
objs := $(srcs:.cc=.o)
objs := $(filter-out $(managers) GenVoigtian.o,$(objs)) 

.PHONY: all clean
all: libGooCommon.so 

%.o: %.cc %.hh
	nvcc -O3 -Xcompiler -fPIC -IPDFs/ -I. -Irootstuff -c $< -o $@

libGooCommon.so: $(objs)
	nvcc -shared $^ -o $@

clean:
	@rm -rf $(objs)
