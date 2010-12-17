module M = LO.Message
module S = LO.Server

let handler path data =
  Printf.printf "Handling %s\n%!" path;
  if List.mem `True data then
    Printf.printf "Found true!!\n%!"

let () =
  let s = S.create 7777 handler in
  while true do
    S.recv s
  done
