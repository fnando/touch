require "test_helper"

class UpdateTest < Minitest::Test
  let(:user) { User.create! }
  let(:task) { user.tasks.create! }

  test "updates the parent's collection field" do
    Task.touch(:user)
    tasks_updated_at = user.reload.tasks_updated_at
    task.update_attributes title: "Some title"

    refute_equal tasks_updated_at, user.reload.tasks_updated_at
  end

  test "updates the parent record" do
    Task.touch(:user)
    updated_at = user.updated_at
    task.update_attributes title: "Some title"

    refute_equal updated_at, user.reload.updated_at
  end
end
