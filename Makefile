TARGET  := main
OBJECTS := main.o 
INCLUDE := ./

CC      := gcc
CFLAGS  := -std=c99 -Wpedantic -Wall -Wextra

# TODO: Directory for object files.

LD      := gcc

INCLUDE := $(addprefix -I,$(INCLUDE))

$(TARGET): $(OBJECTS)
	$(LD) -o $@ $(LDFLAGS) $^

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

.PHONY: clean

clean:
	@rm -f $(TARGET) *.o
