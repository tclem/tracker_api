module TrackerApi
  module Endpoints
    class Integration
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def get(project_id, id)
        data = client.get("/projects/#{project_id}/integrations/#{id}").body

        Resources::Integration.new({ client: client }.merge(data))
      end

      def update(project_id, id, params = {})
        data = client.put("/projects/#{project_id}/integrations/#{id}", params: params).body

        Resources::Integration.new({ client: client, project_id: project_id }.merge(data))
      end

      def delete(project_id, id)
        client.delete("/projects/#{project_id}/integrations/#{id}").status == 204
      end
    end
  end
end
