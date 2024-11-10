cmake_minimum_required(VERSION 3.29)
project(plt)

set(CMAKE_CXX_STANDARD 20)

set(SRC_DIR "src")
set(PARSER_DIR "${CMAKE_CURRENT_BINARY_DIR}")

find_package(FLEX 2.6 REQUIRED)
find_package(BISON 3.0 REQUIRED)

set(LEXER_OUT "${PARSER_DIR}/lexer.c")
set(PARSER_OUT "${PARSER_DIR}/parser.c")

flex_target(LEXER "${SRC_DIR}/lexer.l" "${LEXER_OUT}" DEFINES_FILE "${PARSER_DIR}/lexer.h")
bison_target(PARSER "${SRC_DIR}/parser.y" "${PARSER_OUT}" DEFINES_FILE "${PARSER_DIR}/parser.h")
add_flex_bison_dependency(LEXER PARSER)

#add_executable(calc "${SRC_DIR}/main.c" "${LEXER_OUT}" "${PARSER_OUT}")
add_executable(plt lex.yy.c)
target_include_directories(calc PRIVATE "${PARSER_DIR}")

