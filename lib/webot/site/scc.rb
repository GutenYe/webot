module Webot
  module Site
    class SCC < Base
      BASE_URL = "https://sceneaccess.eu"

      def activity
        agent.goto "#{BASE_URL}/browse"
        check_login %r~/browse~

        return true
      end
    end
  end
end
