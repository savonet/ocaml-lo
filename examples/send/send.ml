let () =
  let addr = LO.Address.default () in
  LO.send addr "/1/fader1" [`Float 0.5]
