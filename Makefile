CC       := gcc
CFLAGS   := -Wall -Wextra -Wshadow -Wconversion -Wsign-conversion -std=c11
INCLUDES := -Iinclude

DEBUG_FLAGS   := -g -O0
RELEASE_FLAGS := -O2

BUILD ?= debug

ifeq ($(BUILD),release)
	CFLAGS += $(RELEASE_FLAGS)
else
	CFLAGS += $(DEBUG_FLAGS)
endif

SRC := $(wildcard src/*.c)
OBJ := $(SRC:src/%.c=build/obj/%.o)
DEP := $(OBJ:.o=.d)

TARGET := bin/helloworld

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJ)
	@mkdir -p bin
	$(CC) $(OBJ) -o $@

build/obj/%.o: src/%.c
	@mkdir -p build/obj
	$(CC) $(CFLAGS) $(INCLUDES) -MMD -MP -c $< -o $@

-include $(DEP)

clean:
	rm -rf build bin

