# encoding: utf-8

module Webot
  module Site
    class Cnepub < Base
      BASE_URL = "http://www.cnepub.com"

      attr_reader :agent

      def bonus
        # 每日签到 8:00-23:59
        agent.goto "#{BASE_URL}/discuz/plugin.php?id=dsu_paulsign:sign"
        agent.wait_until{ agent.text =~ /每日签到/ }

        if agent.text =~ /您今天已经签到过了或者签到时间还未开始/
          Webot.ui.say "SKIP: 您今天已经签到过了或者签到时间还未开始"
          return true
        end

        form = agent.form(id: "qiandao")
        form.set2("//ul[@class='qdsmile']/li[#{rand(9)+1}]")
        form.set2("./table[2]/tbody/tr[1]/td/label[2]/input")
        form.set2("./table[1]/tbody/tr/td/div/a")

        return true
      end
    end
  end
end
