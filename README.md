## SJCL_rb
[![Build Status](https://secure.travis-ci.org/mdp/sjcl_rb.png)](http://travis-ci.org/mdp/sjcl_rb)

A Ruby gem to interop with SJCL in AES-CCM mode.

Defaults to 256 bit AES in CCM mode with 100_000 iterations PBKDF2

### Install

gem install sjcl

### Usage

    enc = SJCL.encrypt('password', "Something to encrypt")
    dec = SJCL.decrypt('password', enc)

    # Custom number of PBKDF2 iterations
    enc = SJCL.encrypt('password', "Something to encrypt", {:iter => 10_000})

### Usage

    dec = SJCL.decrypt('password', enc)

### Dev Goals

- Should be 100% compatible with SJCL Javascript library in AES-CCM mode
- Should not be dependent upon OpenSSL having been compiles with AES-CCM-256 support (May be slower)

### TODO

- Test interop with node module directly
