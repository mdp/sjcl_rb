## SJCL_rb
[![Build Status](https://secure.travis-ci.org/mdp/sjcl_rb.png)](http://travis-ci.org/mdp/sjcl_rb)

A demonstration of SJCL AES-CCM in pure Ruby. Not supported now that [Gibberish](https://github.com/mdp/gibberish) is compatible with SJCL.

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
- Written in pure ruby

### TODO

- Test interop with node module directly

### Changelog

- 1.0.1
  - Match comparison fucntion from SJCL js
  - Include SJCL version in JSON
  - Better errors thrown
  - Update docs
- 1.0.0
  - Update to use OpenSSL PBKDF2 function for increased speed
  - Increase default iterations to 100,000
