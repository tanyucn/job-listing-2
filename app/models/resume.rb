class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :job

  validates :content, presence: true

  mount_uploader :attachment, AttachmentUploader


end
# 修改这个文件夹的时候要重开rails s服务
