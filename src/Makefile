SOURCES = LO_stubs.c LO.mli LO.ml
RESULT = lo
CLIBS = lo
CFLAGS = -Wall -g

all: ncl

test: ncl
	ocamlopt -I . lo.cmxa unix.cmxa test.ml -o test
	./test

include OCamlMakefile