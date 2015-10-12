class Task < ActiveRecord::Base
  belongs_to :list

  scope(:completed, -> do
    where({:completed => true})
  end)

  scope(:not_completed, -> do
    where({:completed => false})
  end)

  validates :description, :presence => true
  # define_method(:==) do |another_task|
  #   self.description().==(another_task.description())
  # end
end
