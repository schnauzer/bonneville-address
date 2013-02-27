class AddSlugToSections < ActiveRecord::Migration
  def change    
    add_column :sections, :slug, :string
    add_index :sections, :slug, unique: true

    Section.find_each(&:save)
  end
end
