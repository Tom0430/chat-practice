module RoomUserHelper
    def delete_entering_record
        silent_users = User.where(last_sending_time: 1000.minutes.ago..2.minutes.ago)
        silent_users.each do |silent_user|
            rooms = silent_user.rooms
            rooms.clear
        end
    end
end
