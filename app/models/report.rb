class Report < ApplicationRecord

  validates :date, {presence:true}
  validates :time, {presence:true}
  validates :job,{presence:true}

end
