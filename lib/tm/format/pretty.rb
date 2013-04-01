require 'rainbow'

module TM
  module Format
    class Pretty
      include Format

      def format(entity)
        normalize_entity(entity).each_pair do |title, value|
          printf("%s: ", title.bright)
          printf("%s\n", value.to_s.color(:green))
        end
      end
    end
  end
end
