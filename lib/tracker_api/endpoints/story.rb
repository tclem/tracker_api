module TrackerApi
  module Endpoints
    class Story
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def get(project_id, id, params={})
        data = client.get("/projects/#{project_id}/stories/#{id}", params: params).body

        Resources::Story.new({ client: client, project_id: project_id }.merge(data))
      end

      def get_story(story_id, params={})
        data = client.get("/stories/#{story_id}", params: params).body

        Resources::Story.new({ client: client }.merge(data))
      end

      def create(project_id, params = {})
        data = client.post("/projects/#{project_id}/stories", params: params).body

        Resources::Story.new({ client: client, project_id: project_id }.merge(data))
      end

      def update(project_id, id, params = {})
        data = client.put("/projects/#{project_id}/stories/#{id}", params: params).body

        Resources::Story.new({ client: client, project_id: project_id }.merge(data))
      end

      def delete(project_id, id)
        client.delete("/projects/#{project_id}/stories/#{id}").status == 204
      end

      def update(story, params={})
        raise ArgumentError, 'Valid story required to update.' unless story.instance_of?(Resources::Story)

        data = client.put("/projects/#{story.project_id}/stories/#{story.id}", params: params).body

        story.attributes = data
      end
    end
  end
end
