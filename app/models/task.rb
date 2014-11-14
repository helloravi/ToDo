# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  done       :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

class Task < ActiveRecord::Base
  scope :done, -> {where(done: true)}
  scope :pending, -> {where(done: false)}

  def mark_done!
    update_attribute(:done, true)
  end
end
