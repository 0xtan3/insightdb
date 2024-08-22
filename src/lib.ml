open Printf

(* Custom types *)
(* type key = string
type value = string *)
type handle = int

(* let open_dir _dir  = 3 *)

(* Expands tilda *)
let expand_tilda path =
  if String.starts_with ~prefix:"~" path then
    let home = Sys.getenv "HOME" in
    home ^ String.sub path 1 (String.length path - 1)
  else
    path

let create_handle () =
  let () = Random.self_init () in 
  let random_number = Random.int 1000000 in
  random_number

(* let get_handle () = failwith "todo" *)

 

let open_dir dir  = 
(* Open a new or existing datastore for read-only access *)
(* Directories and files in it must be readable by this process *)
(* Handle exceptions  *)
  let exp_dir = expand_tilda dir in
  if Sys.file_exists exp_dir then
    begin
      printf "File exists...\n";
      create_handle ()
    end
  else
    begin
      printf "File does not exist. Creating a new file...\n";
      Sys.mkdir exp_dir 0o444;
      printf "%s has been created.\n" exp_dir;
      create_handle ()
    end
(* 
let get_value handle key =
  (* Retrieve a value by key from datastore. *)
  (* Handle exceptions  *)

let put_value handle key value = 
  (* Store a key and value in datastore. *)
  (* Handle exceptions  *)

let delete_key handle key = 
  (* Delete a key from datastore. *)
  (* Handle exceptions *)
 *)

