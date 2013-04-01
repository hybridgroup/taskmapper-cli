require 'terminal-table'

module TM
  module Format
    class Table
      include Format

      def before(entity = {})
        @@table = Terminal::Table.new :headings => normalize_entity(entity).keys
        @@table.align_column(0, :right)
      end

      def format(entity)
        @@table << normalize_entity(entity).values
      end

      def after
        puts @@table.to_s
      end
    end
  end
end
