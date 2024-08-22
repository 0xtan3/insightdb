let test_open_dir () =
  Alcotest.(check int) "handle value" 2 (Lib.open_dir "~/ocaml_test")

  let () =
  let open Alcotest in
  run "Utils" [
      "string-case", [
          test_case "Lower case"     `Quick test_open_dir;
        ];
      (* "string-concat", [ test_case "String mashing" `Quick test_str_concat  ];
      "list-concat",   [ test_case "List mashing"   `Slow  test_list_concat ]; *)
    ]