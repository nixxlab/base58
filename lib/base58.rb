module Base58
  # See https://en.wikipedia.org/wiki/Base58
  ALPHABET = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
  BASE = ALPHABET.size

  def self.from_int int
    raise ArgumentError, 'Value passed is not an Integer.' unless int.is_a?(Integer)

    b58 = ''
    while int >= BASE
      mod = int % BASE
      b58 = ALPHABET[mod, 1] + b58
      int = (int - mod) / BASE
    end
    ALPHABET[int,1] + b58
  end # Base58.from_int

  # From ASCII-8BIT or strARY
  def self.from_str str, include_leading_zeroes = true
    raise ArgumentError, 'Value passed is not a String.' unless str.is_a?(String)
    raise ArgumentError, 'Value passed is not binary.' unless str.encoding == Encoding::BINARY

    if str.empty?
      return from_int(0) 
    elsif include_leading_zeroes
      nzeroes = str.bytes.find_index{|b| b != 0} || str.length - 1
      prefix = ALPHABET[0] * nzeroes
    else
      prefix = ''
    end

    prefix + from_int(str.unpack('H*')[0].to_i(16), alphabet)
  end # Base58.from_str

  def self.to_int b58
    int = 0
    b58.reverse.split(//).each_with_index do |char,index|
      raise ArgumentError, 'Value passed not a valid Base58 String.' if (char_index = ALPHABET.index(char)).nil?
      int += char_index * (BASE ** index)
    end
    int
  end # Base58.to_int

  def self.to_str b58
    nzeroes = b58.chars.find_index{|c| c != ALPHABET[0]} || b58.length-1
    prefix = nzeroes < 0 ? '' : '00' * nzeroes
    [prefix + to_int(b58).to_s(16)].pack('H*')
  end # Base58.to_str
end # Base58