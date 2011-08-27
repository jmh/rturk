module RTurk
  # <SearchQualificationTypesResponse>
  #   <OperationRequest><RequestId>ac5ce55a-e8b4-495c-b7dc-03549a22ae12</RequestId></OperationRequest>
  #   <SearchQualificationTypesResult>
  #     <Request><IsValid>True</IsValid></Request>
  #     <NumResults>10</NumResults>
  #     <TotalNumResults>90</TotalNumResults>
  # 
  #     <QualificationType>...</QualificationType>
  #     <QualificationType>...</QualificationType>
  #     <QualificationType>...</QualificationType>
  #   
  #   </SearchQualificationTypesResult>
  # </SearchQualificationTypesResponse>

  class SearchQualificationTypesResponse < Response
    attr_accessor :num_results, :total_results, :page_number, :qualification_types


    def initialize(response)
      @raw_xml = response.body
      @xml = Nokogiri::XML(@raw_xml)
      raise_errors
      map_content(@xml.xpath('//SearchQualificationTypesResult'),
        :num_results => 'NumResults',
        :total_results => 'TotalNumResults',
        :page_number => 'PageNumber')
    end

    def qualification_types
      @qualification_types ||= begin
        @xml.xpath('//QualificationType').inject([]) do |arr, hit_xml|
          arr << QualificationTypeParser.new(hit_xml); arr
        end
      end
    end
    
  end
  
end
