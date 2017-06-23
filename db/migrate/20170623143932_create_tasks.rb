class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :body
      t.references :user, foreign_key: true
      t.references :admin, foreign_key: true
      t.column :status, :integer, default: 0

      t.timestamps
    end
  end
end
