PROJECT=faxcoder
PROGG4=faxg4coder
PROGLZW=faxlzwcoder
PROGS=$(PROGG4) $(PROGLZW)
SRCSPBM=src/pbm.c
SRCSG4=src/g4code.c src/faxg4coder.c
SRCSLZW=src/lzwcode.c src/faxlzwcoder.c

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
