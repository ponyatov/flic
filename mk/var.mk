# var
MODULE = $(notdir $(CURDIR))
REL    = $(shell git rev-parse --short=5    HEAD)
BRANCH = $(shell git rev-parse --abbrev-ref HEAD)
NOW    = $(shell date +%y%m%d)
