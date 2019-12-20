# frozen_string_literal: true

require 'optparse'
require 'hello_world'

module HelloWorld
  Options = Struct.new(:languages, :list, :help)

  class Parser
    @cli = nil

    class << self
      attr_accessor :cli

      def parse(argv, cli = nil)
        self.cli ||= cli

        Options.new.tap do |args|
          opt_parser = define_option_parser(args)
          opt_parser.parse!(argv)
          args.languages = argv.reject { |a| a =~ /^-/ }
        end
      end

      private

      def define_option_parser(args)
        OptionParser.new do |opts|
          opts.banner = <<~BANNER
            #{heading 'DESCRIPTION'}
              Prints Hello World in one of the #{::HelloWorld::HELLO_WORLD.size} languages.

              Language argument can be a substring. The first language starting with it is used.

            #{heading 'USAGE'}
              hello-world language
              hello-world [ options ]

            #{heading 'EXAMPLES'}
              hello-world -L
              hello-world english
              hello-world eng
              hello-world en
              hello-world spa
              hello-world spanish

            #{heading 'OPTIONS'}
          BANNER

          opts.on('-L', '--list', 'Print the languages supported by the gem') do
            args.list = true
          end

          opts.on('-h', '--help', 'Prints this help') do
            print_help(args, opts)
          end
        end
      end

      def print_help(args, opts)
        puts(opts.to_s, "\n")
        args.help = true
      end

      def heading(text)
        text.bold.blue
      end
    end
  end
end
