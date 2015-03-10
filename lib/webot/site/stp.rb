module Webot
  module Site
    class STP < Base
      BASE_URL = "https://stopthepress.es"

      def activity
        agent.goto "#{BASE_URL}/torrents.php"
        check_login %r~/torrents.php~

        return true
      end
    end
  end
end
