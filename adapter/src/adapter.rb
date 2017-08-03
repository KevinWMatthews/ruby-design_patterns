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

# What if need to read from a string instead of a file?
# The String class does not provide the getc() and eof() methods.
# If we provide them then everything will work.
class StringIOAdapter
  def initialize(string)
    @string = string
    @position = 0
  end

  def getc
    if @position >= @string.length
      raise EOFError
    end
    ch = @string[@position]
    @position += 1
    return ch
  end

  def eof?
    return @position >= @string.length
  end
end
