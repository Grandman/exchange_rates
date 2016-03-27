# config/initializers/sidekiq_scheduler.rb
require 'sidekiq/scheduler'

Sidekiq.schedule = YAML.load_file(File.expand_path('../../../config/dollar_rate_job.yml', __FILE__))
Sidekiq::Scheduler.reload_schedule!
