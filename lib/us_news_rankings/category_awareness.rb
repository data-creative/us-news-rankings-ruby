require 'active_support/concern'

module CategoryAwareness
  extend ActiveSupport::Concern

  included do
    def initialize(year)
      category = self.class.name.gsub("AnnualList","Category").constantize.new
      super(category: category, year: year)
    end
  end

  #class_methods do
  #  ...
  #end
end
