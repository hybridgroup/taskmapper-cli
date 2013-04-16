require_relative 'tm/version.rb'

require_relative 'tm/string_extensions'

# Taskmapper provider handler 
require_relative 'tm/provider_handler'

# Commands
require_relative 'tm/commands/command'
require_relative 'tm/commands/list_all_projects'
require_relative 'tm/commands/first_project'
require_relative 'tm/commands/last_project'
require_relative 'tm/commands/single_project'
require_relative 'tm/commands/list_all_tasks'
require_relative 'tm/commands/first_task'
require_relative 'tm/commands/last_task'
require_relative 'tm/commands/single_task'
require_relative 'tm/commands/create_task'
require_relative 'tm/commands/create_comment'
require_relative 'tm/commands/generate_provider'

# Formatters
require_relative 'tm/commands/list_all_comments_for_task'

require_relative 'tm/format/format'
require_relative 'tm/format/csv'
require_relative 'tm/format/pretty'
require_relative 'tm/format/table'

require_relative 'tm/exceptions'

module TM

end

