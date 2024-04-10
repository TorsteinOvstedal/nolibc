TARGET  := main
OBJECTS := main.o 
INCLUDE := ./

# TODO: Directory for object files.

CC      := gcc
CFLAGS  := -std=c99 -Wpedantic -Wall -Wextra
CFLAGS  += -nostdinc

AS      := nasm
ASFLAGS := -f elf64

LD      := gcc
LDFLAGS := -nostdlib

OBJECTS := start.o $(OBJECTS)
INCLUDE := $(addprefix -I,$(INCLUDE))

$(TARGET): $(OBJECTS)
	$(LD) -o $@ $(LDFLAGS) $^

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

%.o: %s.
	$(AS) $(ASFLAGS) -o $@ $<

.PHONY: clean

clean:
	@rm -f $(TARGET) *.o
