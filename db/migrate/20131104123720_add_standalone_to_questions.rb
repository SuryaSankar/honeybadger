class AddStandaloneToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :standalone, :boolean, default: false
  end
end
