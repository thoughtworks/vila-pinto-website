class AddTypeToPartners < ActiveRecord::Migration
  
  def migrate(direction)
    super
    # remove all partners to ensure that there will be no partner without a type
    Partner.delete_all if direction == :up
  end
  
  def change
    add_column :partners, :type, :string
  end
end
