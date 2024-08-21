(* Interface API *)
open Unix

(* Custom types *)
type key = String
type value = String
type handle

let open_dir dir  = 
  (* Open a new or existing datastore for read-only access *)
  (* Directories and files in it must be readable by this process *)
  (* Handle exceptions  *)


let get_value handle key =
  (* Retrieve a value by key from datastore. *)
  (* Handle exceptions  *)

let put_value handle key value = 
  (* Store a key and value in datastore. *)
  (* Handle exceptions  *)

let delete_key handle key = 
  (* Delete a key from datastore. *)
  (* Handle exceptions *)


