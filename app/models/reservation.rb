class Reservation < ActiveRecord::Base
  
  named_scope :nick_birthday,  :conditions =>  {:date => "2010-12-07" }
  named_scope :first_half,   :conditions =>  ["date >= ? and date <= ?", '2010-01-01', '2010-07-30']
  named_scope :december,   :conditions => ["STRFTIME('%m', date) = ?", Date.new(2010, 12, 1).strftime('%m')]
  named_scope :nick_hibberd, :conditions => {:name => "Nick Hibberd"}
  named_scope :time,lambda { |*args|
      unless args.first.blank?
        { :conditions => [ "time = ?", args.first ] }   
      end
    }
  

  
  FILTERS = [
    {:scope => "all",         :label => "All"},
    {:scope => "first_half",      :label => "First half of the year"},
    {:scope => "nick_birthday",    :label => "Nick's birthday"},
    {:scope => "december",    :label => "december"},
    {:scope => "nick_hibberd",    :label => "nick_hibberd"},        
    {:scope => "time",    :label => "time"},
  ]
  
  def input_date=(user_date)
    self.date = Date.parse(user_date)
  end
  
  def input_date
    self.date
  end
  
end