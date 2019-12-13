# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

set :output, 'log/cron.log'
set :environment, "development"
set :path, "/path/to/app"


every 1.minute do
    rake 'task_sample:delete_entering_record'
end

