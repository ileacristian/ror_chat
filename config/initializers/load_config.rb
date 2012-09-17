config_file = File.join(Rails.root.to_s, "config", "config.yml")

APP_CONFIG = YAML.load_file(config_file)[Rails.env]
