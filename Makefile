CC=gcc
CFLAGS=-Wall -Wextra -Werror -std=c89
CLIBS=
OUT=[[FILES]]

all: $(OUT)

clean:
	rm -f $(OUT) *.dev.*

%: %.c
	$(CC) $(CFLAGS) -o $@ $< $(CLIBS)