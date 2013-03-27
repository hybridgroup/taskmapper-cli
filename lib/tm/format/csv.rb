module TM
  module Format
    class CSV
      def before(entity); end
      def after; end

      def format(entity)
        puts "#{entity.values.join(", ")}"
      end
    end
  end
end
