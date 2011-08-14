class AddCountersToDjsAndStyles < ActiveRecord::Migration
  def change
    add_column :djs, :gigs, :integer
    add_column :styles, :popularity, :integer
  end
end
