CXXFLAGS  += -O2 -fPIC -pthread -g
LDFLAGS   += -fPIC -pthread -g

root_objs := TMinuit.o TRandom.o TRandom3.o 
root_objs := $(addprefix rootstuff/,$(root_objs))

.SUFFIXES: 

all:	libRootUtils.so 

rootstuff/%.o:	rootstuff/%.cc rootstuff/%.hh 
	$(CXX) -I. $(CXXFLAGS) -c -o $@ $<

libRootUtils.so:	$(root_objs)
			$(CXX) $(LDFLAGS) -shared -o $@ $^ 

clean: cmd += rm -f *.o $(root_objs) libRootUtils.so &&

