class BattleChannel < ApplicationCable::Channel
  def subscribed
    stream_from "battle_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def attack
    # ActionCable.server.broadcast "battle_channel", message: "hoge"
  end
end
