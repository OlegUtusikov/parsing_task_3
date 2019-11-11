CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
project(Obfusk)
LIST( APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake )

set(CMAKE_C_COMPILER "C:/MinGW/bin/gcc.exe")
set(CMAKE_CXX_COMPILER "C:/MinGW/bin/g++.exe")

set(ANTLR4CPP_JAR_LOCATION ${PROJECT_SOURCE_DIR}/thirdparty/antlr/antlr-4.7-complete.jar)

# add external build for antlrcpp
include( ExternalAntlr4Cpp )

include_directories( ${ANTLR4CPP_INCLUDE_DIRS} )
link_directories( ${ANTLR4CPP_LIBS} )
message(STATUS "Found antlr4cpp libs: ${ANTLR4CPP_LIBS} and includes: ${ANTLR4CPP_INCLUDE_DIRS} ")

antlr4cpp_process_grammar(demo antlrcpptest
  ${CMAKE_CURRENT_SOURCE_DIR}/TLexer.g4
  ${CMAKE_CURRENT_SOURCE_DIR}/TParser.g4)
# include generated files in project environment
include_directories(${antlr4cpp_include_dirs_antlrcpptest})


add_executable(test_antlr main.cpp ${antlr4cpp_src_files_antlrcpptest})
add_dependencies(test_antlr antlr4cpp antlr4cpp_generation_antlrcpptest)
target_link_libraries(test_antlr antlr4-runtime)