module Webot
  module Site
    class PTP < Base
      BASE_URL = "https://tls.passthepopcorn.me"

      def activity
        agent.goto "#{BASE_URL}/torrents.php"
        check_login %r~/torrents.php~

        return true
      end
    end
  end
end
