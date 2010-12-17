module Address = struct
  type t

  external create : string -> string -> t = "caml_lo_address_new"
  let create host port = create host (string_of_int port)
end

module Message = struct
  type t

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

  external create : unit -> t = "caml_lo_message_new"

  external add : t -> data -> unit = "caml_lo_message_add"

  let add_list m d =
    List.iter (add m) d

  external send : Address.t -> string -> t -> unit = "ocaml_lo_send_message"
end

let send addr path data =
  let m = Message.create () in
  Message.add_list m data;
  Message.send addr path m

module Server = struct
  type t

  external create : string -> (string -> Message.data array -> unit) -> t = "caml_lo_server_new"
  let create p h =
    create
      (string_of_int p)
      (fun p d -> h p (Array.to_list d))

  external recv : t -> unit = "caml_lo_server_recv"
end
