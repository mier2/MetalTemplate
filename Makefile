# Copyright 2020-2021 Apple Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

APP_00WINDOW_OBJECTS=learn-metal/00-window/00-window.o


ifdef DEBUG
DBG_OPT_FLAGS=-g
else
DBG_OPT_FLAGS=-O2
endif

ifdef ASAN
ASAN_FLAGS=-fsanitize=address
else
ASAN_FLAGS=
endif

CC=clang++
CFLAGS=-Wall -std=c++17 -I./metal-cpp -I./metal-cpp-extensions -fno-objc-arc $(DBG_OPT_FLAGS) $(ASAN_FLAGS)
LDFLAGS=-framework Metal -framework Foundation -framework Cocoa -framework CoreGraphics -framework MetalKit 

VPATH=./metal-cpp

%.o: %.cpp
	$(CC) -c $(CFLAGS) $< -o $@


all: build/00-window

.PHONY: all

build/00-window: $(APP_00WINDOW_OBJECTS) Makefile
	$(CC) $(CFLAGS) $(LDFLAGS) $(APP_00WINDOW_OBJECTS) -o $@

build/01-primitive: $(APP_01PRIMITIVE_OBJECTS) Makefile
	$(CC) $(CFLAGS) $(LDFLAGS) $(APP_01PRIMITIVE_OBJECTS) -o $@



clean:
	rm -f $(APP_00WINDOW_OBJECTS) \
		build/00-window \
		
