# dirs
CWD   = $(CURDIR)
ifneq (,$(wildcard $(HOME)/distr/cross))
DISTR = $(HOME)/distr/cross
endif
BIN   = $(CWD)/bin
LIB   = $(CWD)/lib
INC   = $(CWD)/inc
SRC   = $(CWD)/src
REF   = $(CWD)/ref
TMP   = $(CWD)/tmp
