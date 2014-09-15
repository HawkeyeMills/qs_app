module ActiveRecordExtension
  extend ActiveSupport::Concern

  def self.upsert(attributes)
	  begin
	  	create(attributes)
	  rescue ActiveRecord::RecordNotUnique, PG::UniqueViolation => e
	    find_by_primary_key(attributes['primary_key']).
	    update(attributes)
	  end
  end
end

ActiveRecord::Base.send(:include, ActiveRecordExtension)