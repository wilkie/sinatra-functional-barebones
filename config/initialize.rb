auth_file = File.expand_path('./config/auth_keys.yml')
auth_file_sample = File.expand_path('./config/auth_keys.yml.sample')

FileUtils.cp(auth_file_sample, auth_file) unless File.exists?(auth_file)

auth = YAML.load_file(auth_file)[ENV['RACK_ENV']]

ENV["authorization_providers"] = ""

if auth && auth['authorization']
  auth['authorization'].each do |provider, value|
    value.each do |key, value|
      ENV["authorization_#{provider}_#{key}"] = value.to_s
    end
    ENV["authorization_providers"] = "#{ENV["authorization_providers"]} #{provider} "
  end
end
