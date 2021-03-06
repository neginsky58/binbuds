class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|

      t.string    :name
      t.text      :desc

      t.integer   :user_id

      t.integer   :item_state_id, :deafult => 1
      t.decimal   :price, :precision => 10, :scale => 2
      t.string    :currency
      t.integer   :condition_id
      t.boolean   :is_negotiable      

      t.integer   :category_id
      t.integer   :person_type_id
      t.integer   :size_id

      t.string    :link

      t.timestamps
    end
  end
end
