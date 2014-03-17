require 'base64'

module SJCL
  module Misc

    def self.pbkdf2(password, salt, iter, length)
      salt = Base64.decode64(salt)
      key = PBKDF2.new(:password=>password,
                 :salt=>salt,
                 :key_length => length/8,
                 :iterations=>iter).hex_string
      SJCL::Codec::Hex.toBits(key)
    end

  end
end
