module Webot
  module Site
    class BTN < Base
      BASE_URL = "https://broadcasthe.net"

      def activity
        agent.goto "#{BASE_URL}/torrents.php"
        check_login %r~/torrents.php~

        return true
      end
    end
  end
end
