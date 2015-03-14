
module FirstOrBuild
  def first_or_build(attributes = nil, options = {}, &block)
    first || build(attributes, options, &block)
  end
end

class ActiveRecord::Relation
  include FirstOrBuild
end


