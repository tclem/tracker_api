module TrackerApi
  module Resources
    class Integration
      include Virtus.model

      attribute :client

      attribute :kind, String
      attribute :id, Integer
      attribute :project_id, Integer
      attribute :can_import, Boolean
      attribute :base_url, String
      attribute :is_other, Boolean
      attribute :story_name, String
      attribute :name, String
      attribute :active, Boolean

      attribute :created_at, DateTime
      attribute :updated_at, DateTime
    end
  end
end
