#
# Copyright (c) 2016 Mike Maraya <mike[dot]maraya[at]gmail[dot]com>
# All rights reserved.
#
# This file is subject to the terms and conditions defined in
# https://github.com/mmaraya/swift/blob/master/LICENSE,
# which is part of this software package.
#
#

SHELL     := /bin/sh
PROGRAM   := crypto
SRC_DIR   := src
BIN_DIR   := bin
INC_DIR   := include
CPP_FILES := $(wildcard $(SRC_DIR)/*.swift)
CXX       := swiftc
CXX_FLAGS := -g

.PHONY: all clean test

all: $(BIN_DIR)/$(PROGRAM)

$(BIN_DIR)/$(PROGRAM): $(CPP_FILES)
	@mkdir -p $(@D)
	$(CXX) $(CXX_FLAGS) -o $@ $^

clean:
	rm -f $(BIN_DIR)/$(PROGRAM)

test: $(BIN_DIR)/$(PROGRAM)
	$(BIN_DIR)/$(PROGRAM)
