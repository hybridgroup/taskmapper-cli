require 'rainbow'

module TM
  module Format
    class Pretty
      def before(entity); end
      def after; end

      def format(entity)
        entity.each_pair do |title, value|
          printf("%s: ", title.bright)
          printf("%s\n", value.to_s.color(:green))
        end
      end
    end
  end
end
