class CreateQuantities < ActiveRecord::Migration[5.1]
    def change
        create_table :quantities do |t|

            t.string :symbol, unique: true
            t.boolean :vector, default: false, null: false

            t.string :slug, null: false, unique: true, index: true

            t.timestamps

        end

        reversible do |dir|
            dir.up do
                Quantity.create_translation_table! name: { type: :string, unique: true }, description: { type: :text }
            end

            dir.down do
                Quantity.drop_translation_table!
            end
        end
    end
end
