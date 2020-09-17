class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :image

      t.timestamps
    end
  end
end
