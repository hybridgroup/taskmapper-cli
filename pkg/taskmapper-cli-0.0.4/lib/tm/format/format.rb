module TM
  module Format
    PROJECT_KEYS = %w[id name description created_at updated_at]
    TICKET_KEYS = %w[status priority title resolution assignee requestor project_id]
    COMMENT_KEYS = %w[author body ticket_id]

    def before(entity); end
    def after; end

    def normalize_entity(entity) 
      entity.keys.inject({}) do |hash, key|
        if PROJECT_KEYS.include?(key) || TICKET_KEYS.include?(key) || COMMENT_KEYS.include?(key)
          hash[key] = entity[key] 
        end
        hash
      end
    end

  end
end
