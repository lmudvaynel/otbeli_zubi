class Removecontent < ActiveRecord::Migration
  def change
    remove_column :pages, :content
    add_column :pages, :left_content, :text
    add_column :pages, :right_content, :text
  end
end
