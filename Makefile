TARGET  := main
OBJECTS := main.o sys.o
INCLUDE := ./

CC      := gcc
CFLAGS  := -std=c99 -Wpedantic -Wall -Wextra
CFLAGS  += -nostdinc

AS      := nasm
ASFLAGS := -f elf64

LD      := gcc
LDFLAGS := -nostdlib

OBJECTS := start.o $(OBJECTS)
OBJECTS := $(addprefix obj/,$(OBJECTS))

INCLUDE := $(addprefix -I,$(INCLUDE))
CFLAGS  += $(INCLUDE)

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
