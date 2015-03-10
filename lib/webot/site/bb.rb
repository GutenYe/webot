module Webot
  module Site
    class BB < Base
      BASE_URL = "https://baconbits.org"

      def activity
        agent.goto "#{BASE_URL}/torrents.php"
        check_login %r~/torrents.php~

        return true
      end
    end
  end
end
