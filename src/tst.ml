open Lib

let test_open () =
  let _= (module Handle: Alcotest.TESTABLE with type t = Handle.t) in 
  match Lib.open_ "~/ocaml_test" with
  (* | Ok a -> Alcotest.p(check Unix.dir_handle) "handle value" (Handle 2) a *)
  | Ok a ->
    (* Check if 'a' is of the expected type Unix.dir_handle *)
    let _ : Unix.dir_handle = a in  (* This line checks that 'a' is of the correct type *)
    Printf.printf "Test passed: handle value is of the expected type Unix.dir_handle.";
    flush stdout;  (* Ensure the output is flushed *)
  | Error _ -> 
    Alcotest.fail "Test failed: Expected a handle, but got an error."

let test_close () =
  let _= (module Handle: Alcotest.TESTABLE with type t = Handle.t) in 
  match Lib.close "" with
  | Ok 

(* Unix module has the open_dir but the issue is the modules could not be done as it dosent support pp and formatting for the module
and also we dont know what value to be compared with. So check the return type and go with it *)
  
(* 
  let test_open_dir () =
    let handle = (module Handle : Alcotest.TESTABLE with type t = Handle.t) in 
    match Lib.open_dir "~/ocaml_test" with
    (* Alcotest.(check handle) is a function used to compare two values. *)
    | Ok h -> Alcotest.(check handle) "handle value" (Handle 2) h 
    | Error _ -> Alcotest.fail "Expected Ok handle but got an error" *)
  

  let () =
  let open Alcotest in
  run "Utils" [
      "db_api_test-case", [
          test_case "API"     `Quick test_open;
          test_case "API"     `Quick test_close;
        ];
      (* "string-concat", [ test_case "String mashing" `Quick test_str_concat  ];
      "list-concat",   [ test_case "List mashing"   `Slow  test_list_concat ]; *)
    ]