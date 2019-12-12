module RoomsHelper
    def delete_room_authentication
        session.delete(:authenticated_room)
    end

    def leaving_room(user, room)
        user_room = user.rooms.where(id: room.id)
        user.rooms.destroy(user_room)
    end

    module_function :leaving_room
end
