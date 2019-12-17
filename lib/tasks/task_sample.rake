namespace :task_sample do
    desc "task_sample_use_model"
    task :task_model => :environment do
        silent_users = User.where(last_sending_time: 1000.minutes.ago..2.minutes.ago)
        silent_users.each do |silent_user|
            rooms = silent_user.rooms
            rooms.clear
        end
    end
end