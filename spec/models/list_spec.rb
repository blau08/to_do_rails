require 'rails_helper'

describe List do
  it { should validate_presence_of :name }
  it { should have_many :tasks }
end

describe Task do
  it { should validate_presence_of :description }
  it { should belong_to :list }

  describe ".completed" do
    it ("returns the completed tasks") do
      test_task1 = Task.create({:description => "gotta do it", :completed => false})
      test_task2 = Task.create({:description => "gotta do it too", :completed => false})
      uncompleted_tasks = [test_task1, test_task2]
      completed_tasks = Task.create({:description => "completed task", :completed => true})
      expect(Task.completed()).to(eq([completed_tasks]))
    end
  end

end
