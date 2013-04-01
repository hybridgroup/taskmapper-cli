module TM
  module Commands
    class FirstTask 
      def initialize(provider_handler, formatter, attributes = '')
        @provider_handler = provider_handler
        @formatter = formatter
        @attributes = attributes.extend(TM::StringExtensions).to_hash
      end

      def execute
        project = @provider_handler.taskmapper.project(@attributes)
        ticket = project.tickets.first
        @formatter.before(ticket)
        @formatter.format(ticket)
        @formatter.after
      end
    end
  end
end
