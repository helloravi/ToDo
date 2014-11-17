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

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "should mark pending task done if true is passed" do
    task = tasks(:pending)
    assert !task.done?
    task.mark_done!(true)
    task.reload
    assert task.done?
  end

  test "should not change done task if true is passed" do
    task = tasks(:done)
    assert task.done?
    task.mark_done!(true)
    task.reload
    assert task.done?
  end

  test "should mark done task undone if false is passed" do
    task = tasks(:done)
    assert task.done?
    task.mark_done!(false)
    task.reload
    assert !task.done?
  end

  test "should not change pending task done if false is passed" do
    task = tasks(:pending)
    assert !task.done?
    task.mark_done!(false)
    task.reload
    assert !task.done?
  end
end
