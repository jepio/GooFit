CXXFLAGS     += -O2 -fPIC -pthread -g
LDFLAGS      += -fPIC -pthread -g

OBJECTS		:= TMinuit.o TRandom.o TRandom3.o 
OBJECTS := $(addprefix rootstuff/,$(OBJECTS))

.SUFFIXES: 

all:	libRootUtils.so 

rootstuff/%.o:	rootstuff/%.cc rootstuff/%.hh 
	$(CXX) -I. $(CXXFLAGS) -c -o $@ $<

libRootUtils.so:	$(OBJECTS)
			$(CXX) $(LDFLAGS) -shared -o $@ $^ 

clean: cmd += rm -f *.o $(OBJECTS) libRootUtils.so &&

