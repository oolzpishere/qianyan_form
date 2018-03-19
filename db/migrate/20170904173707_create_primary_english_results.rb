class CreatePrimaryEnglishResults < ActiveRecord::Migration[5.1]
  def change
    create_table :primary_english_results do |t|
      t.belongs_to :result, index: true
      t.string :openid
      t.string :unionid
      t.string :form
      t.string :form_name
      t.text :entry
      t.string :gen_code
      t.datetime :form_created_at
      t.datetime :form_updated_at

      t.timestamps
    end

    add_index :primary_english_results, :openid
    add_index :primary_english_results, :unionid
    add_index :primary_english_results, :form
    add_index :primary_english_results, :gen_code
  end
end
