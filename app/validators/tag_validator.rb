# class TagValidator < ActiveModel::Validator
#   def validate(record)
#     if current_user.tags.include?(record)
#       record.errors[:title] << "Tag with this title already exists."
#     end
#   end
# end