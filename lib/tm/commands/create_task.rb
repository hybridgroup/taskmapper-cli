module TM
  module Commands 
    class CreateTask < Command

      def execute(task_attributes) 
        project = @provider_handler.taskmapper.project(@attributes)
        task_attributes = task_attributes.extend(TM::StringExtensions).to_hash
        ticket = project.ticket! task_attributes
        @formatter.before(ticket)
        @formatter.format(ticket)
        @formatter.after
      end
    end
  end
end
