module TM
  module Commands
    class FirstProject
      def initialize(provider_handler, formatter)
        @provider_handler = provider_handler
        @formatter = formatter
      end

      def execute
        project = @provider_handler.taskmapper.projects.first
        @formatter.before(project)
        @formatter.format(project)
        @formatter.after
      end
    end
  end
end
