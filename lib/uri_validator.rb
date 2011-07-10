class UriValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /^[\w-]+$/ 
      record.errors[attribute] << ('Неверный uri')  
    end  
  end
end

