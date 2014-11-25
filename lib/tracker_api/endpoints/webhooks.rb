module TrackerApi
  module Endpoints
    class Webhooks
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def get(project_id)
        data = client.paginate("/projects/#{project_id}/webhooks")
        raise TrackerApi::Errors::UnexpectedData, 'Array of webhooks expected' unless data.is_a? Array

        data.map do |webhook|
          Resources::Webhook.new({ client: client }.merge(webhook))
        end
      end

      def create(project_id, params = {})
        data = client.post("/projects/#{project_id}/webhooks", params: params).body

        Resources::Webhook.new({ client: client, project_id: project_id }.merge(data))
      end
    end
  end
end
