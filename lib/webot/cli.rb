require "thor"

module Webot
  class CLI < Thor
    class_option "no-color",               banner: "Disable colorization in output", type: :boolean
    class_option "verbose", aliases: "-V", banner: "Enable verbose output mode", type: :boolean

    def initialize(*)
      super
      self.options = self.options.dup
      the_shell = (options["no-color"] ? Thor::Shell::Basic.new : shell)
      Webot.ui = UI::Shell.new(the_shell)
      Webot.ui.debug! if options["verbose"]
    end

    desc "bonus [site ..]", "bonus"
    def bonus(*sites)
      @sites = sites.empty? ? Rc.sites : sites

      run_sites { |site|
        site.bonus
      }
    end

    desc "activity [site ..]", "activity"
    def activity(*sites)
      @sites = sites.empty? ? Rc.activities : sites

      run_sites { |site|
        site.activity
      }
    end

  private

    def run_sites(&blk)
      agent = Site.init_agent
      err_counts = 0

      @sites.each {|name|
        unless Site.has_site?(name)
          Webot.ui.error "SKIP: can't find site -- #{name}"
          next
        end

        Webot.ui.say "Performing #{name} ..."
        site = Site[name].new(agent)
        begin
          err = blk.call(site)
        rescue Timeout::Error, Watir::Wait::TimeoutError => e
          Webot.ui.error "SKIP: #{e.message}"
          err_counts += 1
        else
          err_counts += 1 unless err
        end
      }

      if err_counts == 0
        agent.quit
      end
    end
  end
end
