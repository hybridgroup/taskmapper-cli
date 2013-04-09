require 'tm/version.rb'

require 'tm/string_extensions'

# Taskmapper provider handler 
require 'tm/provider_handler'

# Commands
require 'tm/commands/command'
require 'tm/commands/list_all_projects'
require 'tm/commands/first_project'
require 'tm/commands/last_project'
require 'tm/commands/single_project'
require 'tm/commands/list_all_tasks'
require 'tm/commands/first_task'
require 'tm/commands/last_task'
require 'tm/commands/single_task'
require 'tm/commands/create_task'
require 'tm/commands/create_comment'

# Formatters
require 'tm/commands/list_all_comments_for_task'

require 'tm/format/format'
require 'tm/format/csv'
require 'tm/format/pretty'
require 'tm/format/table'

require 'tm/exceptions'

module TM

end

