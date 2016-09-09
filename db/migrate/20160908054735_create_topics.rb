class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.string :link
      t.string :img

      t.timestamps
    end
  end
end
