require 'terminal-table'

module TM
  module Format
    class Table
      def before(entity = {})
        @@table = Terminal::Table.new :headings => entity.keys
        @@table.align_column(0, :right)
      end

      def format(entity)
        @@table << entity.values
      end

      def after
        puts @@table.to_s
      end
    end
  end
end
