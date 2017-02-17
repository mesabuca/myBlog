class CreateWelcomes < ActiveRecord::Migration[5.0]
  def change
    create_table :welcomes do |t|
      t.string :mainTitle
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
