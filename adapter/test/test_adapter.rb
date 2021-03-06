#!/usr/bin/env ruby

require_relative '../src/adapter.rb'

encrypter = Encrypter.new('some secret key')

# Encrypt the file
reader = File.open('message.txt')
writer = File.open('message.encrypted', 'w')
encrypter.encrypt(reader, writer)
writer.close
reader.close

# Decrypt the file
reader = File.open('message.encrypted')
writer = File.open('message.decrypted', 'w')
encrypter.encrypt(reader, writer)
writer.close
reader.close

reader = StringIOAdapter.new("Test string.")
writer = File.open('string.encrypted', 'w')
encrypter.encrypt(reader, writer)
writer.close

reader = File.open('string.encrypted')
writer = File.open('string.decrypted', 'w')
encrypter.encrypt(reader, writer)
writer.close
reader.close
