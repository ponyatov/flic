# src
C += $(wildcard $(SRC)/*.c*)
H += $(wildcard $(INC)/*.h*)
J += $(wildcard $(LIB)/*.js) $(wildcard $(TMP)/*.js)
F += $(wildcard $(LIB)/*.ini) $(wildcard $(LIB)/*.f)
R += $(wildcard $(SRC)/*.rs) $(wildcard $(CWD)/dsp/*.rs)
RS = $(R) Cargo.toml .cargo/* memory.x

# CP += $(TMP)/$(MODULE).parser.cpp $(TMP)/$(MODULE).lexer.cpp
# HP += $(TMP)/$(MODULE).parser.hpp

OBJ += $(TMP)/vm.o $(TMP)/compiler.o $(TMP)/microrl.o

# some tools
# CX += bin/crlf.cpp
