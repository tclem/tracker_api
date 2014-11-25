module TrackerApi
  module Endpoints
    class Webhook
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def get(project_id, id)
        data = client.get("/projects/#{project_id}/webhooks/#{id}").body

        Resources::Webhook.new({ client: client }.merge(data))
      end

      def update(project_id, id, params = {})
        data = client.put("/projects/#{project_id}/webhooks/#{id}", params: params).body

        Resources::Webhook.new({ client: client, project_id: project_id }.merge(data))
      end

      def delete(project_id, id)
        client.delete("/projects/#{project_id}/webhooks/#{id}").status == 204
      end
    end
  end
end
