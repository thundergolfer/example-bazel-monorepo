#!/usr/bin/env ruby
# frozen_string_literal: true

require 'sinatra'
require 'pp'
require 'awesome_print'
require 'rbconfig'
require 'stringio'
require 'colored2'

require 'hello_world'

Colored2.disable!

# ~/.aprc file.
AwesomePrint.defaults = {
  color: {
    args:       :black,
    array:      :black,
    bigdecimal: :black,
    class:      :black,
    date:       :black,
    falseclass: :black,
    integer:    :black,
    float:      :black,
    hash:       :black,
    keyword:    :black,
    method:     :black,
    nilclass:   :black,
    rational:   :black,
    string:     :black,
    struct:     :black,
    symbol:     :black,
    time:       :black,
    trueclass:  :black,
    variable:   :black
  }
}

def clean_environment_variables
  ENV.keys.reject do |key|
    key =~ /^(DIRENV|SAML|AWS|assword|BashMatic|txt|bld|und|bak|App|fg_|bg_|_fzf_|_|Lib|Color|[a-z_]+$)/\
  end
end

def style
  <<~HTML
    <style>
      body {
        font-family: Corbel, sans-serif; background-color: #FFFFE0;
      }
      pre {
        font-family: consolas, monaco, courier, mono-spaced;
        font-size: 11pt;
        font-weight: 600;
      }
      h1 {
        font-family: HelveticNeue-CondensedBold, Helvetica, san-serif;
        font-size: 24pt;
      }
      h2 {
        margin-bottom: 30px;
        color: #F70;
      }
      table tr td {
        border-top: 1px solid #eee;
        padding-bottom: 3px;
        padding-top: 3px;
        vertical-align: top;
      }
      .language-dropdown {
        background-color: white;
        border-radius: 10px;
        border: 1px solid #333;
        box-shadow: 5px 5px 15px 0px #999;
        margin: 100px auto;
        padding: 10px;
        text-align: center;
        width: 500px;
      }
      .debugging-info {
        background-color: #EEE;
        background-color: white;
        border-radius: 10px;
        border: 1px solid #222;
        box-shadow: 5px 5px 15px 0px #999;
        font-family: consolas, monaco, courier, mono-spaced;
        margin: 100px auto;
        padding: 10px;
        width: 1200px;
      }
    </style>
  HTML
end

def main(language: 'english', debug: false)
  <<~HTML
    <html>
      #{style}
      <body>
        <div class="language-dropdown">
          <h2>Hello World in #{HelloWorld::HELLO_WORLD.keys.size} Languages</h2>

          <h1>#{language ? HelloWorld.hello_world_in(language) : 'Choose Your Language'}</h1>

          <form action="/">
            <select name="l" onchange="submit()">
              <option value=""></option>
              #{HelloWorld::HELLO_WORLD.keys.map { |l| %(<option value="#{l}" #{l == language ? 'selected' : ''}>#{l.to_s.capitalize}</option>) }.join("\n")}
            </select>
          </form>
        </div>

        #{debug ? debugging_info : ''}

      </body>
    </html>
  HTML
end

def debugging_info
  <<~HTML
    <div class="debugging-info">
          <h1>Gem Environment</h1>
          <pre>
    #{`gem environment`}
          </pre>

          <h1>C/C++ Binaries</h1>
          <pre>
    gcc:    #{`command -v gcc`}
    cc1:    #{`command -v cc1`}
    g++:    #{`command -v g++`}
    cc:     #{`command -v cc`}

    gcc -v  #{`$(command -v gcc) -v 2>&1`.gsub(/ --/, "\n--").gsub(/\n/, "\n\t\t")}
    cc  -v  #{`$(command -v  cc) -v 2>&1`.gsub(/ --/, "\n--").gsub(/\n/, "\n\t\t")}
          </pre>

          <h1>RbConfig::MAKEFILE_CONFIG</h1>
          <pre>
    #{RbConfig::MAKEFILE_CONFIG.awesome_inspect}
          </pre>

          <h1>System Environment</h1>
          <table>
            #{
              output = StringIO.new
              clean_environment_variables.sort.each do |key|
                value = ENV[key]
                if key =~ /path/i && value =~ /:/
                  value = value.split(':').join('<br />')
                end
                output.puts "<tr><td>#{key}</td><td>#{value}</td></tr>"
              end
              output.string
            }
          </table>
      </div>
  HTML
end

# ——————————————————————————— This is where Sinatra Begins Yo ———————————————————————————————

get '/' do
  debug = params['debug']
  language = HelloWorld.determine_language(params['l'])
  main(language: language, debug: debug)
end
