PROJECT=faxcoder
PROGG4=g4coder
PROGLZW=lzwcoder
PROGS=$(PROGG4) $(PROGLZW)
SRCSPBM=src/pbm.c
SRCSG4=src/g4code.c src/g4coder.c
SRCSLZW=src/lzwcode.c src/lzwcoder.c

CFLAGS=-O3 -funroll-all-loops -finline-functions -Wall

OBJSPBM=$(SRCSPBM:.c=.o)
OBJSG4=$(SRCSG4:.c=.o)
OBJSLZW=$(SRCSLZW:.c=.o)

all: $(PROGS)

clean:
	rm -f $(PROGS) $(OBJSPBM) $(OBJSG4) $(OBJSLZW)

$(PROGG4): $(OBJSPBM) $(OBJSG4)
	$(CC) $(CFLAGS) -o $@ $^

$(PROGLZW): $(OBJSPBM) $(OBJSLZW)
	$(CC) $(CFLAGS) -o $@ $^
