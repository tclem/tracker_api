module TrackerApi
  module Resources
    class Webhook
      include Virtus.model

      attribute :client

      attribute :id, Integer
      attribute :project_id, Integer
      attribute :webhook_url, String
      attribute :webhook_version, String

      attribute :kind, String
      attribute :created_at, DateTime
      attribute :updated_at, DateTime
    end
  end
end
