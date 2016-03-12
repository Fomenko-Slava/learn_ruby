class AddUserRefToPetitions < ActiveRecord::Migration
  def change
    add_reference :petitions, :user, after: :description, index: true, foreign_key: true
  end
end
