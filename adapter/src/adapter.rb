# Thisis our existing class
class Encrypter
  def initialize(key)
    @key = key
  end

  # Accept two opened files.
  # Read one file one byte at a time, encrypt each byte, and write them out.
  def encrypt(reader, writer)
    key_index = 0
    while not reader.eof?
      clear_char = reader.getc.ord
      encypted_char = clear_char ^ @key[key_index].ord
      writer.putc(encypted_char)
      key_index = (key_index + 1) % @key.size
    end
  end
end
