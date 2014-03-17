## SJCL_rb
[![Build Status](https://secure.travis-ci.org/mdp/sjcl_rb.png)](http://travis-ci.org/mdp/sjcl_rb)

A Ruby gem to interop with SJCL in AES-CCM mode.

Defaults to 256 bit AES in CCM mode with 10_000 iteration PBKDF2

### Install

gem install sjcl

### Usage

    enc = SJCL.encrypt('password', "Something to encrypt")
    dec = SJCL.decrypt('password', enc)

### Dev Notes

This is a very naive implementation of SJCL's AES library in ruby.
It's not been optimized for performance and instead tries to be a very
close approximation of SJCL in terms of code and organization.

### TODO

- More modes
- Test interop with node module directly
- Test more scenarios
