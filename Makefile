###############################################################
# Copyright Danh Nguyen 2021
# Based on GNU C++ standard
#
# https://github.com/danny-cpp
###############################################################
CC	:= g++
SRCDIR	:= src
BLDDIR	:= build
TARGET	:= bin/runner

SRC	:= $(shell find $(SRCDIR) -type f -name *.cpp)
OBJS	:= $(patsubst $(SRCDIR)/%, $(BLDDIR)/%, $(SRC:.cpp=.o))
INCLUDE	:= -I include

.PHONY: all clean

all: $(TARGET)
	echo "Running"
	echo $(SRC)
	echo $(OBJS)

$(TARGET): $(OBJS)
	echo "Linking objs"
	echo "$(CC) -o $@ $^"
	$(CC) -o $@ $^

# Automatic dependency required for this section
$(BLDDIR)/%.o: $(SRCDIR)/%.cpp
	mkdir -p $(BLDDIR)
	echo "Compiling translation units"
	$(CC) $(INCLUDE) $(CFLAGS) -c -o $@ $<

clean:
	rm -fr $(BLDDIR)
	rm -fr bin/*