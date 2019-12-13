namespace :task_sample do
    desc "実行処理の説明"
    task :delete_entering_record => :environment do
        silent_users = User.where(last_sending_time: 1000.minutes.ago..2.minutes.ago)
        silent_users.each do |silent_user|
            rooms = silent_user.rooms
            rooms.clear
        end
    end
end