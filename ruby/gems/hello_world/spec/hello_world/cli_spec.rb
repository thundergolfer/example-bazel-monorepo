# frozen_string_literal: true

require 'spec_helper'
require 'hello_world/cli'
require 'hello_world/parser'
require 'forwardable'

module HelloWorld
  RSpec.describe CLI do
    let(:cli) { described_class.create(argv: argv) }

    describe '--help' do
      let(:argv) { %w(--help) }

      it 'should display help screen' do
        expect(Parser).to receive(:print_help)
        expect(cli).to receive(:response)
        cli.execute!
      end
    end

    LANGUAGES = %i(english turkish french).freeze

    LANGUAGES.each do |lan|
      describe 'en' do
        let(:argv) { [lan] }
        before { cli.execute! }

        it 'should show hello world in English' do
          expect(cli.responses[lan]).to eq HelloWorld.hello_world_in(lan)
        end
      end
    end
  end
end
