###############################################################
# Standard Makefile template for all projects
# Copyright Danh Nguyen 2021
# Based on GNU C++ standard
#
# https://github.com/danny-cpp
###############################################################
PRJNAME := main

# These following directories are assumed to exist; abide to GNU guideline.
CC	:= g++
SRCDIR	:= src
BLDDIR	:= build
TARGET	:= bin/$(PRJNAME)

# Do not remove -MP -MD flags. These are necessary for generating *.d files,
# which contains rules for headers
CFLAGS := -std=c++11 -MP -MD
DEBUG := $(CFLAGS) -Wall -O0 -g -D_GLIBCXX_DEBUG
RELEASE := $(CFLAGS) -O3 -march=native

# CONFIGURE RELEASE/DEBUG MODE HERE
MODE := $(DEBUG)

SRC	:= $(shell find $(SRCDIR) -type f -name *.cpp)
OBJS	:= $(patsubst $(SRCDIR)/%, $(BLDDIR)/%, $(SRC:.cpp=.o))
INCLUDE	:= -I include

.PHONY: all clean

all: $(TARGET)
	echo "Finalizing"
	#echo $(SRC)
	#echo $(OBJS)

$(TARGET): $(OBJS)
	#echo "Linking objs"
	#echo "$(CC) -o $@ $^"
	$(CC) $(MODE) -o $@ $^
-include $(BLDDIR)/*.d

# This section already include automatic dependency tracking by using -include
# directive above. Do not add anything in the rules
$(BLDDIR)/%.o: $(SRCDIR)/%.cpp
	mkdir -p $(BLDDIR)
	#echo "Compiling translation units"
	$(CC) $(INCLUDE) $(MODE) -c -o $@ $<


clean:
	rm -fr $(BLDDIR)
	rm -fr bin/*



