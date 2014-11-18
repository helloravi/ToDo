# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  done       :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Task < ActiveRecord::Base
	belongs_to :user

	validates :title, presence: true
	validates :user, presence: true

  def mark_done!(status)
    update_attribute(:done, status)
  end
end
