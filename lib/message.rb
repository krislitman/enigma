require_relative 'enigma'
require_relative 'encryption'
require_relative 'decryption'

class Message

  def initialize(phrase)
    @phrase = phrase
    routes(phrase)
  end

  def routes(phrase)
    case
    when ARGV.length < 4
      encrypt_option(phrase)
    end
  end

  def self.start(to_encrypt)
    phrase = to_encrypt.read.to_s.downcase
    Message.new(phrase)
  end

  def encrypt_option(phrase)
    enigma = Enigma.new
    encrypted = enigma.encrypt(phrase)
    writer = File.open(ARGV[1], 'w')
    name = ARGV[1].to_s
    writer.write(encrypted[:encryption])
    puts "Created '#{name}' with the key #{encrypted[:key]} and the date #{encrypted[:date]}"
    writer.close
  end
end
