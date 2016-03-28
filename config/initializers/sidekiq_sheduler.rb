# config/initializers/sidekiq_scheduler.rb
require 'sidekiq/scheduler'

Sidekiq.schedule = {
    'DollarRateWorker' =>
      {
        'every'=> [Figaro.env.parse_job_interval], 'class' => 'DollarRateWorker',
        'queue' => 'default'
      }
    }
Sidekiq::Scheduler.reload_schedule!
