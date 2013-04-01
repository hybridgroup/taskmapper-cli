module TM
  module Format
    class CSV
      include Format

      def format(entity)
        puts "#{normalize_entity(entity).values.join(", ")}"
      end
    end
  end
end
