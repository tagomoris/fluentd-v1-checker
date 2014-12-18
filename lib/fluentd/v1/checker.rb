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
        v0 = parse_classic(path).to_s.rstrip + "\n"
        v1 = parse_v1(v1conf_path || path).to_s.rstrip + "\n"
        diff = Diffy::Diff.new(v0, v1, :include_diff_info => true ).to_s(:color)
        if diff.strip.empty? && v1conf_path
          # ok
        elsif diff.strip.empty?
          # ok
        else
          diff = diff.sub(/--- .*$/){ "--- CLASSIC PARSE" }.sub(/\+\+\+ .*$/){ "+++ V1 PARSE" }
          puts diff
          exit 1
        end
      end
    end
  end
end
