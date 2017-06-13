// lib.rs

#![crate_type = "staticlib"]
#![allow(ctypes)]

extern crate libc;
use libc::c_int;

#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
    }
}

#[no_mangle] 
pub extern "C" fn add(lhs: c_int, rhs: c_int) -> c_int {
  lhs + rhs
}

// *EOF*
