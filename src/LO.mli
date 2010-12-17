exception Error
exception Unhandled

module Address : sig
  type t

  val create : string -> int -> t
end

module Message : sig
  type timetag = int * int

  type data =
    [
      `Int32 of int
    | `Float of float
    | `String of string
    | `Blob of string
    | `Int64 of int
    | `Timetag of timetag
    | `Double of float
    | `Symbol of string
    | `Char of char
    | `Midi of string
    | `True
    | `False
    | `Nil
    | `Infinitum
    ]
end

val send : Address.t -> string -> Message.data list -> unit

module Server : sig
  type t

  val create : int -> (string -> Message.data list -> unit) -> t

  val recv : t -> unit
end
