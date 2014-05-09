module Jarvis
  module Boot
    class Constants
      def initialize
        JARVIS[:root] = root
        JARVIS[:debug] = debug
        JARVIS[:version_splitted] = version_splitted
        JARVIS[:version] = version
      end

      def root
        File.expand_path(File.join(__dir__, '..', '..', '..'))
      end

      def debug
        ARGV.delete '--debug' if ARGV.include? '--debug'
      end

      def version_splitted
        v = {
          major: 1,
          minor: 4,
          patch: 2,
          pre: nil }
      end

      def version
        [
          JARVIS[:version_splitted][:major],
          JARVIS[:version_splitted][:minor],
          JARVIS[:version_splitted][:patch],
          JARVIS[:version_splitted][:pre]
        ].compact.join('.')
      end
    end
  end
end
