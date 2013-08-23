class AddHtmlContentToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :html_content, :string
    add_column :notes, :text, :string
  end
end
