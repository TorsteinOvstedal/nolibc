TARGET  := main
OBJECTS := main.o sys.o
INCLUDE := ./
MODE    := debug

CC      := gcc
CFLAGS  := -std=c99 -Wpedantic -Wall -Wextra
CFLAGS  += -nostdinc -m64 

AS      := nasm
ASFLAGS := -f elf64

LD      := gcc
LDFLAGS := -nostdlib

OBJECTS := start.o $(OBJECTS)
OBJECTS := $(addprefix obj/,$(OBJECTS))

INCLUDE := $(addprefix -I,$(INCLUDE))
CFLAGS  += $(INCLUDE)

ifeq ($(MODE), debug)
	CFLAGS  += -gdwarf -Og
	ASFLAGS += -gdwarf
else
	CFLAGS  += -O0 -s
endif

$(TARGET): $(OBJECTS)
	$(LD) -o $@ $(LDFLAGS) $^

obj/%.o: %.c | obj
	$(CC) -c $(CFLAGS) -o $@ $<

obj/%.o: %.s | obj
	$(AS) $(ASFLAGS) -o $@ $<

obj:
	mkdir obj

.PHONY: clean

clean:
	@rm -rf $(TARGET) obj/
