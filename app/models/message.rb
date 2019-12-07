class Message < ApplicationRecord
    validates :content, presence: true
    # createの後にコミットする { MessageBroadcastJobのperformを遅延実行 引数はself }
    after_create_commit { MessageBroadcastJob.perform_later self }
    belongs_to :user, required: true
    belongs_to :room, required: true
end
