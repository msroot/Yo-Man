module  Yo
  module Man
    
    extend ActiveSupport::Concern

        included do
          if Rails::VERSION::MAJOR >= 5
            prepend_before_action :rails_yo_before_filter
            after_action :rails_yo_after_filter
          else
            prepend_before_filter :rails_yo_before_filter
            after_filter :rails_yo_after_filter
          end
        end
        
        
        def rails_yo_before_filter
          Rails.logger.info "rails_yo_before_filter"
        end
        
        def rails_yo_after_filter
          Rails.logger.info "rails_yo_after_filter"
        end
        
  end
end

ActionController::Base.send(:include, Yo::Man)