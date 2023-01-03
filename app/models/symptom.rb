class Symptom < ApplicationRecord
  belongs_to :user

  def self.column_name
    Symptom.where('headache > 3 OR fever > 3 OR vomiting > 3 OR constipation > 3 OR stomach_ache > 3 OR diarrhea > 3')
           .select(
             :headache, :fever, :vomiting, :nausea, :stomach_ache, :constipation, :diarrhea
           ).column_names.reject do |column_name|
      %w[id updated_at created_at comment date time
         user_id].include?(column_name)
    end
  end
end
