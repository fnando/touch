require "active_record"
require "touch/version"

module Touch
  extend ActiveSupport::Concern

  module ClassMethods
    def touch(association_name, options = {})
      options = options.dup
      options.reverse_merge!(on: %w[create update destroy])
      options[:on].map!(&:to_s)

      options[:on].each do |event|
        add_collection_touch_for(association_name, event)
      end
    end

    private
    def add_collection_touch_for(association_name, event)
      class_eval <<-RUBY, __FILE__, __LINE__ + 1
        def collection_touch_event_for_#{association_name}_on_#{event}
          parent = public_send(:#{association_name})
          field_name = "\#{self.class.model_name.cache_key}_updated_at"

          parent.try(:touch, field_name)
        end

        after_#{event} :collection_touch_event_for_#{association_name}_on_#{event}
      RUBY
    end
  end
end

ActiveRecord::Base.send :include, Touch
