# frozen_string_literal: true

require_relative 'parser'
require 'colored2'
require 'stringio'
module HelloWorld
  class CLI
    attr_reader :stdin, :stdout, :stderr, :kernel, :argv, :args, :responses

    class << self
      def create(
        argv: ARGV.dup,
        stdin: STDIN,
        stdout: STDOUT,
        stderr: STDERR,
        kernel: ::Kernel
      )
        new(argv, stdin, stdout, stderr, kernel)
      end
    end

    def initialize(argv = ARGV.dup, stdin = STDIN, stdout = STDOUT, stderr = STDERR, kernel = ::Kernel)
      @argv   = argv
      @stdin  = stdin
      @stdout = stdout
      @stderr = stderr
      @kernel = kernel

      @args = Parser.parse(@argv, self)

      @responses = {}
    end

    def execute!
      return if args.help

      output = StringIO.new

      output.puts hw_hash.keys.join("\n") if args.list

      args.languages.each do |language|
        speakish = hw.determine_language(language)
        responses[speakish] = hw.hello_world_in(speakish)
      end

      response(output)
    end

    def response(stringio)
      responses.each_pair do |language, hello_world|
        stringio.puts "#{(sprintf '%<hw>20.20s', hw: language.to_s.capitalize).bold.blue} — #{hello_world.yellow}\n\n"
      end
      stringio.string
    end

    def hw_hash
      HelloWorld::HELLO_WORLD
    end

    def hw
      HelloWorld
    end
  end
end
