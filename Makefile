
CXX      := g++         # macOS 기본: clang++, 리눅스는 g++도 OK
CXXFLAGS := -std=c++23 -O2 -Wall -Wextra -pedantic -Ithird_party/stb
LDFLAGS  := 
TARGET   := main

SRC := main.cpp
OBJ := $(SRC:.cpp=.o)

# 기본 빌드: release
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJ) $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# 편의 타깃
.PHONY: run clean debug
run: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(OBJ) $(TARGET)