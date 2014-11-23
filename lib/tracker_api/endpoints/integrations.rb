module TrackerApi
  module Endpoints
    class Integrations
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def get(project_id)
        data = client.paginate("/projects/#{project_id}/integrations", params: params)
        raise TrackerApi::Errors::UnexpectedData, 'Array of iterations expected' unless data.is_a? Array

        data.map do |integration|
          Resources::Integration.new({ client: client }.merge(integration))
        end
      end

      def create(project_id, params = {})
        data = client.post("/projects/#{project_id}/integrations", params: params).body

        Resources::Integration.new({ client: client, project_id: project_id }.merge(data))
      end
    end
  end
end
