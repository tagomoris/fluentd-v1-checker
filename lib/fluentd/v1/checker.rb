require "fluentd/v1/checker/version"

require "fluent/config/parser"
require "fluent/config/v1_parser"

require "diffy"

module Fluentd
  module V1
    module Checker
      def self.execute(path)
        str = File.read(path)
        fname = File.basename(path)
        dirname = File.dirname(path)

        conf_v1 = Fluent::Config::V1Parser.parse(str, fname, dirname, Kernel.binding)
        conf_classic = Fluent::Config::Parser.parse(str, fname, dirname)

        diff = Diffy::Diff.new(conf_classic.to_s.rstrip, conf_v1.to_s.rstrip).to_s(:color)
        if diff.empty?
          puts "v1 acceptable."
        else
          puts diff
        end
      end
    end
  end
end
