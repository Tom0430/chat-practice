class TopsController < ApplicationController
    def top
        @room = Room.new
    end
end
