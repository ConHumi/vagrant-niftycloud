require "log4r"

module VagrantPlugins
  module NiftyCloud
    module Action
      # This terminates the running instance.
      class TerminateInstance
        def initialize(app, env)
          @app    = app
          @logger = Log4r::Logger.new("vagrant_niftycloud::action::terminate_instance")
        end

        def call(env)
          env[:ui].info(I18n.t("vagrant_niftycloud.terminating"))
          response = env[:niftycloud_compute].terminate_instances(:instance_id => env[:machine].id)
          env[:machine].id = nil

          @app.call(env)
        end
      end
    end
  end
end
