module Utils

  module YmlCfgReader
    extend self

    def load(root_path, sub_path='config', cfg_file='local_env.yml')
      env_file = File.join(root_path, sub_path, cfg_file)
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end

  end

end
