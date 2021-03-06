require 'tracker_api/version'

# dependencies
require 'virtus'
require 'faraday'
require 'faraday_middleware'
if defined?(ActiveSupport)
  require 'active_support/core_ext/object/blank'
else
  require 'core_ext/object/blank'
end
require 'equalizer'
require 'representable/json'
require 'oj'

# stdlib
require 'addressable/uri'
require 'forwardable'
require 'logger'

Oj.default_options = {:mode => :compat }

module TrackerApi
  autoload :Error, 'tracker_api/error'
  autoload :Client, 'tracker_api/client'
  autoload :Logger, 'tracker_api/logger'

  module Errors
    class UnexpectedData < StandardError; end
  end

  module Endpoints
    autoload :Activity, 'tracker_api/endpoints/activity'
    autoload :Epic, 'tracker_api/endpoints/epic'
    autoload :Epics, 'tracker_api/endpoints/epics'
    autoload :Iterations, 'tracker_api/endpoints/iterations'
    autoload :Integration, 'tracker_api/endpoints/integration'
    autoload :Integrations, 'tracker_api/endpoints/integrations'
    autoload :Labels, 'tracker_api/endpoints/labels'
    autoload :Me, 'tracker_api/endpoints/me'
    autoload :Memberships, 'tracker_api/endpoints/memberships'
    autoload :Notifications, 'tracker_api/endpoints/notifications'
    autoload :Project, 'tracker_api/endpoints/project'
    autoload :Projects, 'tracker_api/endpoints/projects'
    autoload :Stories, 'tracker_api/endpoints/stories'
    autoload :Story, 'tracker_api/endpoints/story'
    autoload :StoryOwners, 'tracker_api/endpoints/story_owners'
    autoload :Task, 'tracker_api/endpoints/task'
    autoload :Tasks, 'tracker_api/endpoints/tasks'
    autoload :Comments, 'tracker_api/endpoints/comments'
    autoload :Webhook, 'tracker_api/endpoints/webhook'
    autoload :Webhooks, 'tracker_api/endpoints/webhooks'
  end

  module Resources
    module Shared
      autoload :HasId, 'tracker_api/resources/shared/has_id'
    end
    autoload :Activity, 'tracker_api/resources/activity'
    autoload :Account, 'tracker_api/resources/account'
    autoload :Change, 'tracker_api/resources/change'
    autoload :Epic, 'tracker_api/resources/epic'
    autoload :Iteration, 'tracker_api/resources/iteration'
    autoload :Integration, 'tracker_api/resources/integration'
    autoload :Me, 'tracker_api/resources/me'
    autoload :MembershipSummary, 'tracker_api/resources/membership_summary'
    autoload :Notification, 'tracker_api/resources/notification'
    autoload :Label, 'tracker_api/resources/label'
    autoload :Person, 'tracker_api/resources/person'
    autoload :PrimaryResource, 'tracker_api/resources/primary_resource'
    autoload :Project, 'tracker_api/resources/project'
    autoload :ProjectMembership, 'tracker_api/resources/project_membership'
    autoload :Story, 'tracker_api/resources/story'
    autoload :Task, 'tracker_api/resources/task'
    autoload :TimeZone, 'tracker_api/resources/time_zone'
    autoload :Comment, 'tracker_api/resources/comment'
    autoload :Webhook, 'tracker_api/resources/webhook'
  end
end
