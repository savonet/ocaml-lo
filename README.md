ocaml-lo
========

This package contains an OCaml interface for the
[liblo](http://liblo.sourceforge.net/) library to use the [Open Sound
Control](http://www.opensoundcontrol.org/)
([OSC](http://www.opensoundcontrol.org/)) protocol.

Prerequisites
-------------

- ocaml
- liblo
- findlib
- dune >= 2.0

Compilation
-----------

```
$ dune build
```

This should build both the native and the byte-code version of the extension
library.

Installation
------------

Via `opam`:

```
$ opam install lo
```

Via `dune` (for developers):

```
$ dune install
```

This should install the library file in the appropriate place.

License
-------

The library is under the LGPL 2.1, see [COPYING](COPYING).
