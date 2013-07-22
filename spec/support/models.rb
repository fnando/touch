ActiveRecord::Schema.define(:version => 0) do
  create_table :users do |t|
    t.datetime :tasks_updated_at
    t.timestamps
  end

  create_table :tasks do |t|
    t.string :title
    t.belongs_to :user
    t.timestamps
  end
end

class User < ActiveRecord::Base
  has_many :tasks
  has_many :things
end

class Task < ActiveRecord::Base
  belongs_to :user
  touch :user
end
