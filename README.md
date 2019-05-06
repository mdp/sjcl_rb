## Modern Crypto

Note: It's 2019 and if you're looking for a modern and actively maintained Ruby encryption library you should do yourself a favor and check out [RbNaCl](https://github.com/crypto-rb/rbnacl), which is based on [LibSodium](https://github.com/jedisct1/libsodium). The code below was designed purely for demonstration purposes and should not be used in applications where serious crypto is needed.

## SJCL_rb
[![Build Status](https://secure.travis-ci.org/mdp/sjcl_rb.png)](http://travis-ci.org/mdp/sjcl_rb)

A demonstration of SJCL AES-CCM in pure Ruby.

Defaults to 256 bit AES in CCM mode with 100_000 iterations PBKDF2

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
