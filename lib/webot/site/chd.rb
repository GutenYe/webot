module Webot
  module Site
    class CHD < Base
      BASE_URL = "https://chdbits.org"

      def activity
        agent.goto "#{BASE_URL}/torrents.php"
        check_login %r~/torrents.php~

        return true
      end
    end
  end
end
