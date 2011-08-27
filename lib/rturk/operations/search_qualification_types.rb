# Operation to search qualification types

module RTurk
  class SearchQualificationTypes < Operation
    attr_accessor :query, :sort_property, :sort_direction, :page_size, :page_number, :requestable, :owned_by_caller
    require_params :requestable

    def parse(xml)
      RTurk::SearchQualificationTypesResponse.new(xml)
    end

    def to_params
      {
        'Query'               => query,
        'SortProperty'        => sort_property,
        'SortDirection'       => sort_direction,
        'PageSize'            => page_size,
        'PageNumber'          => page_number,
        'MustBeRequestable'   => requestable,
        'MustBeOwnedByCaller' => owned_by_caller,
      }
    end
  end

  def self.SearchQualificationTypes(*args)
    RTurk::SearchQualificationTypes.create(*args)
  end
end
