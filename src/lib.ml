open Printf

(* Custom types *)
(* type key = string
type value = string *)
type key = Key of int
type key_list = Key_list of key list
type value = Value of string
type handle = Handle of int

type error =
    | File_not_found
    | Permission_denied
    | Key_not_found
    | Unknown_error of exn

type 'a res =
  | Ok of 'a
  | Error of error


module type Handle_sig = sig 
  type t = handle
  val pp : Format.formatter -> t -> unit
  val equal : t -> t -> bool
end

module Handle = struct
  type t = handle
  let pp ppf handle = 
    match handle with 
    | Handle n -> Format.pp_print_int ppf n
  let equal a b =
    match a, b with
    | Handle a , Handle b -> a = b
end

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
  Handle random_number

let get_handle _ = failwith "todo"

 

let open_dir dir  = 
(* Open a new or existing datastore for read-only access *)
(* Directories and files in it must be readable by this process *)
(* Handle exceptions  *)
  let exp_dir = expand_tilda dir in
  if Sys.file_exists exp_dir then
    begin
      printf "File exists...\n";
      (* get_handle exp_dir *)
      create_handle ()
    end
  else
    begin
      printf "File does not exist. Creating a new file...\n";
      Sys.mkdir exp_dir 0o444;
      printf "%s has been created.\n" exp_dir;
      create_handle ()
    end

let get_value _ = failwith "todo"
  (* Retrieve a value by key from datastore. *)
  (* Handle exceptions  *)

let put_value _ _ _ = failwith "todo"
  (* Store a key and value in datastore. *)
  (* Handle exceptions  *)

let delete_key _ _ = failwith "todo"
  (* Delete a key from datastore. *)
  (* Handle exceptions *)

  let list_keys _ = failwith "todo"
  (* Delete a key from datastore. *)
  (* Handle exceptions *)

  let merge_dir _ = failwith "todo"
  (* Delete a key from datastore. *)
  (* Handle exceptions *)

  let sync _ = failwith "todo"
  (* Delete a key from datastore. *)
  (* Handle exceptions *)

  let close _ = failwith "todo"
  (* Delete a key from datastore. *)
  (* Handle exceptions *)

