module Webot
  module Site
    class BIB < Base
      BASE_URL = "http://bibliotik.org"

      def activity
        agent.goto "#{BASE_URL}/torrents"
        check_login %r~/torrents~

        return true
      end
    end
  end
end
