class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.binary :stream
      t.string :description
      t.boolean :private, default: false
      t.references :user

      t.timestamps
    end
  end
end
