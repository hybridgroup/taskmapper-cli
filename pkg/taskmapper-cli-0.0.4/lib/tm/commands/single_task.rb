module TM
  module Commands
    class SingleTask < Command
      def execute(search_attrs = '') 
        project = @provider_handler.taskmapper.project(@attributes)
        ticket = project.tickets(search_attrs.extend(TM::StringExtensions).to_hash).first
        @formatter.before(ticket)
        @formatter.format(ticket)
        @formatter.after
      end
    end
  end
end
