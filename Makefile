# ========= Makefile (week5) =========
# macOS/리눅스 공통. 학생은 추가 설치 없이 `make`만 실행.
# PNG 로더는 answer.cpp 안에서만 stb_image.h를 사용합니다.
# - stb_image.h 위치: project_root/third_party/stb/stb_image.h (권장)
# - 또는 project_root/stb_image.h 도 허용됩니다(자동 탐색).

CXX      := clang++         # macOS 기본: clang++, 리눅스는 g++도 OK
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