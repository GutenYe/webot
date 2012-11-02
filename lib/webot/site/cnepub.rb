module Webot
  module Site
    class Cnepub < Base
      BASE_URL = "http://www.cnepub.com"

      attr_reader :agent

      def bonus
        # 每日签到 8:00-23:59
        agent.goto "#{BASE_URL}/discuz/plugin.php?id=dsu_paulsign:sign"
        check_login %r~/discuz/plugin\.php\?id=dsu_paulsign:sign~

        form = agent.form(id: "qiandao")
        form.set2("//ul[@class='qdsmile']/li[#{rand(9)+1}]")
        form.set2("./table[2]/tbody/tr[1]/td/label[2]/input")
        form.set2("./table[1]/tbody/tr/td/div/a")
      end
    end
  end
end
