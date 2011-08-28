module RTurk
  # <QualificationType>
  #   <QualificationTypeId>2TP5XH0JPPSINVFMQYJPA5KLM7ZMGT</QualificationTypeId>
  #   <CreationTime>2011-06-16T20:09:56Z</CreationTime>
  #   <Name>Product Search Relevance Qualification Test </Name>
  #   <Description>CLOSED HIT</Description>
  #   <Keywords>search, relevance, product search, queries, search relevance, china, chinese, CN</Keywords>
  #   <QualificationTypeStatus>Active</QualificationTypeStatus>
  #   <RetryDelayInSeconds>86000</RetryDelayInSeconds>
  # </QualificationType>
  
  # for returns from SearchQualificationTypes operation
  class QualificationTypeParser < RTurk::Parser
    attr_reader :qualification_type_id, :creation_time, :name, :description,
                :keywords, :status, :retry_delay_in_seconds

    def initialize(hit_xml)
      @xml_obj = hit_xml
      map_content(@xml_obj,
        :qualification_type_id => 'QualificationTypeId',
        :creation_time => 'CreationTime',
        :name => 'Name',
        :description => 'Description',
        :keywords => 'Keywords',
        :status => 'QualificationTypeStatus',
        :retry_delay_in_seconds => 'RetryDelayInSeconds')

      @keywords = @keywords.split(', ') if @keywords
    end
  end
end
