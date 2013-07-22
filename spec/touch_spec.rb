require "spec_helper"

describe Touch do
  let(:user) { User.create! }
  let(:task) { user.tasks.create! }

  context "on create" do
    it "updates the parent's collection field" do
      Task.touch(:user)

      expect {
        user.tasks.create!
      }.to change { user.reload.tasks_updated_at }
    end

    it "updates the parent record" do
      Task.touch(:user)

      expect {
        user.tasks.create!
      }.to change { user.reload.updated_at }
    end
  end

  context "on update" do
    it "updates the parent's collection field" do
      Task.touch(:user)

      expect {
        task.update_attributes title: "Some title"
      }.to change { user.reload.tasks_updated_at }
    end

    it "updates the parent record" do
      Task.touch(:user)

      expect {
        task.update_attributes title: "Some title"
      }.to change { user.reload.updated_at }
    end
  end

  context "on destroy" do
    it "updates the parent's collection field" do
      Task.touch(:user)

      expect {
        task.destroy!
      }.to change { user.reload.tasks_updated_at }
    end

    it "updates the parent record" do
      Task.touch(:user)

      expect {
        task.destroy!
      }.to change { user.reload.updated_at }
    end
  end
end
