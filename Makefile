.PHONY: all clean

TOP=$(PWD)
EXTERNAL=$(TOP)/3rd
SRC=$(TOP)/src
INCLUDE_DIR=/usr/include/lua5.3
LIB_DIR=/usr/lib

CFLAGS = -g3 -O2 -rdynamic -Wall -I$(INCLUDE_DIR) 
SHARED = -fPIC --shared
LDFLAGS = -L$(LIB_DIR) 

all: lutil.so lkcp.so

lutil.so: $(SRC)/lutil.c
	gcc $(CFLAGS) $(SHARED) $^ -o $@ 

lkcp.so: $(SRC)/lkcp.c  $(EXTERNAL)/kcp/ikcp.c
	gcc $(CFLAGS) $(SHARED) $^ -o $@ $(LDFLAGS) -I$(EXTERNAL)/kcp

all:
	-rm -rf $(TOP)/*.a $(TOP)/*.o

clean:
	-rm -rf *.o *.a *.so
