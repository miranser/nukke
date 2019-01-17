class ChangePublishersNameToNotNullabe < ActiveRecord::Migration[5.2]
  def change
    Publisher.where(name: nil).update_all(name: 'was null')

    change_column :publishers, :name, :string, null: false
  end
end
