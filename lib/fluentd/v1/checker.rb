require "fluentd/v1/checker/version"

require "fluent/config/parser"
require "fluent/config/v1_parser"

require "diffy"

module Fluentd
  module V1
    module Checker
      def self.parse_classic(path)
        str = File.read(path)
        fname = File.basename(path)
        dirname = File.dirname(path)
        Fluent::Config::Parser.parse(str, fname, dirname)
      end

      def self.parse_v1(path)
        str = File.read(path)
        fname = File.basename(path)
        dirname = File.dirname(path)
        Fluent::Config::V1Parser.parse(str, fname, dirname, Kernel.binding)
      end

      def self.execute(path, v1conf_path)
        diff = Diffy::Diff.new( parse_classic(path).to_s.rstrip, parse_v1(v1conf_path || path).to_s.rstrip ).to_s(:color)
        if diff.strip.empty? && v1conf_path
          puts "just same."
        elsif diff.strip.empty?
          puts "v1 acceptable."
        else
          puts diff
        end
      end
    end
  end
end
