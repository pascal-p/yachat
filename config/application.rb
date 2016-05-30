require_relative 'boot'

require 'rails/all'
#
require_relative '../lib/utils/yml_cfg_reader'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Yachat
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # manage config parameters as shell env variables - start
    config.before_configuration do
      Utils::YmlCfgReader.load(Rails.root, 'config', 'local_env.yml')
    end
    # manage config parameters as shell env variables - end
  end
end
