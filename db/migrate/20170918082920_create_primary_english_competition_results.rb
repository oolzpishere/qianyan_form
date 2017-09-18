class CreatePrimaryEnglishCompetitionResults < ActiveRecord::Migration[5.1]
  def change
    create_table :primary_english_competition_results do |t|
      t.belongs_to :result, index: true
      t.string :openid
      t.string :form
      t.string :form_name
      t.text :entry
      t.string :gen_code
      t.datetime :form_created_at
      t.datetime :form_updated_at

      t.timestamps
    end

    add_index :primary_english_competition_results, :openid
    add_index :primary_english_competition_results, :form
    add_index :primary_english_competition_results, :gen_code
  end
end
