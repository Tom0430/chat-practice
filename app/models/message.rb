class Message < ApplicationRecord
    validates :content, presence: true, length: { maximum: 150 }
    # createの後にコミットする { MessageBroadcastJobのperformを遅延実行 引数はself }
    after_create_commit { MessageBroadcastJob.perform_later self }
    belongs_to :user, required: true
    belongs_to :room, required: true
    mount_uploader :image, ImagesUploader
end
