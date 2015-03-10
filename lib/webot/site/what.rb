module Webot
  module Site
    class What < Base
      BASE_URL = "https://what.cd"

      def activity
        agent.goto "#{BASE_URL}/torrents.php"
        check_login %r~/torrents.php~

        return true
      end
    end
  end
end
