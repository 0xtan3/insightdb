open Printf
(* open Unix *)

(* Custom types *)
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

(* Function changes the path from relative to absolute *)
let expand_tilda path =
  if String.starts_with ~prefix:"~" path then
    let home = Sys.getenv "HOME" in
    home ^ String.sub path 1 (String.length path - 1)
  else
    path

(* Function for active files *)
let create_active_file (dir: string) : string res =
  try
    let active_file_path = Filename.concat dir "data.active" in
    let out_channel = open_out active_file_path in
    close_out out_channel;
    Ok active_file_path
  with
  | ex -> Error (Unknown_error ex)

(* let get_actve_files (dir: string) : string res =
  let this_handle = Unix.opendir dir in
  let result = 
    try 
      Unix.rewinddir this_handle;
      let rec find_active_file () = 
        let entry = Unix.readdir this_handle in
        if Filename.check_suffix entry ".active" then
          Ok entry
        else
          find_active_file ()
      in
      find_active_file ()
    with
    | End_of_file -> Error File_not_found
    | ex -> Error (Unknown_error ex)
  in
  Unix.closedir this_handle;
  match result with
  | Error File_not_found -> create_active_file dir
  | other -> other    *)

let open_ dir  = 
(* Open a new or existing datastore for read-only access *)
(* Directories and files in it must be readable by this process *)
(* Handle exceptions  *)
  let exp_dir = expand_tilda dir in
    if Sys.file_exists exp_dir then
      try
        printf "File exists...\n";
        Ok (Unix.opendir exp_dir)
      with   
        _ -> Error (File_not_found)
  else
    try
      printf "File does not exist. Creating a new file...\n";
      Sys.mkdir exp_dir 0o444;
      printf "%s has been created.\n" exp_dir;
      Ok (Unix.opendir exp_dir)
    with 
      _ -> Error (File_not_found)

let get_ (dir_handle: Unix.dir_handle) (key: key) = failwith "todo"
  (* Retrieve a value by key from datastore. *)
  (* Handle exceptions  *) 

let put_ (dir_handle: Unix.dir_handle) (key: key) (value: value) = failwith "todo"
  (* Store a key and value in datastore. *)
  (* Handle exceptions  *)

let delete_ (dir_handle: Unix.dir_handle) (key: key) = failwith "todo"
  (* Delete a key from datastore. *)
  (* Handle exceptions *)

let list_ (dir_handle: Unix.dir_handle) : key_list res = 
(* List all keys from datastore. *)
(* Handle exceptions *)
  let keys = ref [] in
  let rec read_entries () = 
    try 
      let entry = Unix.readdir dir_handle in
    with

let merge dir = failwith "todo"
(* Merge several data files within a datastore into a more
compact form. Also, produce hintfiles for faster startup. *)
(* Handle exceptions *)

let sync (dir_handle: Unix.dir_handle) = failwith "todo"
(* Force any writes to sync to disk. *)
(* Handle exceptions *)
    let entry = Unix.d

let close (dir_handle: Unix.dir_handle) : string res = 
(* Close the datastore. Flush all privileges. *)
(* Handle exceptions *)
try
  Unix.closedir dir_handle;
  Ok "Directory handle closed successfully" 
with
  _ -> Error (Permission_denied)
