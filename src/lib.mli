(** 
  This module provides an interface for interacting with InsightDB, a key-value 
  store designed for efficient read and write operations. It includes functions 
  to open, read, write, delete, and list keys in the datastore, as well as 
  managing datastore handles and error handling.
**)

(* open Unix *)

(* 
Custom types
*)
type key = Key of int
type key_list = Key_list of key list
type value = Value of string
type handle = Handle of int

(* 
type error to handle errors
*)
type error =
    | File_not_found
    | Permission_denied
    | Key_not_found
    | Unknown_error of exn

(* 
This is a result type
*)
type 'a res =
    | Ok of 'a 
    | Error of error

val open_ : string -> Unix.dir_handle res
val get_ : Unix.dir_handle -> key -> value res
val put_ : Unix.dir_handle -> key -> value -> string res 
val delete_ : Unix.dir_handle -> key -> string res
val list_ : Unix.dir_handle -> key_list res
val merge : string -> string res
val sync : Unix.dir_handle -> string res 
val close : Unix.dir_handle -> string res

(*
TODO
*)
(* val fold : *)
(* bitcask:fold(BitCaskHandle,Fun,Acc0)→ Acc Fold over all K/V pairs in a Bitcask datastore.
Fun is expected to be of the form: F(K,V,Acc0) → Acc. *)

(* val opendir_with_opts *)
(* Just like open_dir but with read&write priv. 
   sync_on_put(allows to sync the write file after every write operation). 
   The directory must be readable and writeable by this process *)

(* 
This is a testable type written to handle ADT in alcotest
*)
module type Handle_sig = sig 
    type t = handle 
    val pp : Format.formatter -> t -> unit
    val equal : t -> t -> bool
end

module Handle: Handle_sig


