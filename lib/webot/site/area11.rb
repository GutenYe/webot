# encoding: utf-8

module Webot
  module Site
    class Area11 < Base
      BASE_URL = "http://bbs.area-11.com"

      def bonus
        agent.goto "#{BASE_URL}/member.php?mod=logging&action=login"
        check_login %r~/forum.php~ 

        #sleep 1
        #agent.goto "#{BASE_URL}/forum.php?mod=forumdisplay&fid=11"

        return true
      end
    end
  end
end
