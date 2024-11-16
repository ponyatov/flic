cmake_minimum_required(VERSION 3.12)
get_filename_component(PROJECT_NAME ${CMAKE_SOURCE_DIR} NAME_WE)
project(${PROJECT_NAME} LANGUAGES C CXX)

set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CWD ${CMAKE_SOURCE_DIR})
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CWD}/cmake)
set(INC ${CMAKE_SOURCE_DIR}/inc)
set(SRC ${CMAKE_SOURCE_DIR}/src)
set(TMP ${CMAKE_SOURCE_DIR}/tmp)

file(GLOB C CONFIGURE_DEPENDS ${SRC}/*.c*)
file(GLOB H CONFIGURE_DEPENDS ${INC}/*.h*)
include_directories(${INC} ${TMP})

find_package(RAGEL REQUIRED)
find_package(FLEX  REQUIRED)
find_package(BISON REQUIRED)

# add_definitions(-DISK)
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall")

file(GLOB L CONFIGURE_DEPENDS ${SRC}/*.lex)
file(GLOB Y CONFIGURE_DEPENDS ${SRC}/*.yacc)
get_filename_component(lex  ${L} NAME_WE)
get_filename_component(yacc ${Y} NAME_WE)
message(L=${L})
message(Y=${Y})
 FLEX_TARGET(lex  ${L} ${TMP}/${lex}.lexer.c)
BISON_TARGET(yacc ${Y} ${TMP}/${yacc}.parser.c)

add_library(parser STATIC ${FLEX_lex_OUTPUTS} ${BISON_yacc_OUTPUTS})

add_executable(${PROJECT_NAME} ${C})
target_link_libraries(${PROJECT_NAME} parser)
