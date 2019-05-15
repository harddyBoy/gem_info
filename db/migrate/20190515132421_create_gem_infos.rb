class CreateGemInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :gem_infos do |t|
		t.integer :post_date
		t.string :gem_name
		t.string :title
		t.integer :gem_cve
		t.string :url

		t.timestamps
    end
  end
end
