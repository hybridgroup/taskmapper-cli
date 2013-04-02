require 'taskmapper'
require 'taskmapper-kanbanpad'
require 'taskmapper-github'
require 'taskmapper-basecamp'
require 'taskmapper-bugherd' 
require 'taskmapper-bugzilla'
require 'taskmapper-fogbugz'
require 'taskmapper-github' 
require 'taskmapper-kanbanpad'
require 'taskmapper-lighthouse'
require 'taskmapper-pivotal' 
require 'taskmapper-rally' 
require 'taskmapper-redmine'
require 'taskmapper-trac' 
require 'taskmapper-unfuddle'
require 'taskmapper-zendesk' 

module TM
  class ProviderHandler
    attr_reader :taskmapper

    def initialize(taskmapper)
      @taskmapper = taskmapper
    end

    def self.build_handler(provider, authentication)
      self.new(TaskMapper.new(provider.to_sym, 
                              authentication.extend(TM::StringExtensions).to_hash))
    rescue NameError
      raise TM::InvalidProvider, "Provider doesn't exists" 
    end
  end
end
