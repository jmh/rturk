#   <QualificationType>
#     <QualificationTypeId>WKAZMYZDCYCZP412TZEZ</QualificationTypeId>
#     <Name> WebReviews Qualification Master Test</Name>
#     <Description>This qualification will allow you to earn more on the WebReviews HITs.</Description>
#     <Keywords>WebReviews, webreviews, web reviews</Keywords>
#     <QualificationTypeStatus>Active</QualificationTypeStatus>
#     <CreationTime>2009-05-17T10:05:15Z</CreationTime>
#     <Test>
#       <QuestionForm xmlns="http://mechanicalturk.amazonaws.com/AWSMechanicalTurkDataSchemas/2005-10-01/QuestionForm.xsd">
#         <Overview>
#           <Title>WebReviews Survey</Title>
#           <Text>After you have filled out this survey you will be assigned one or more qualifications...</Text>
#         </Overview>
#         <Question>
#           <QuestionIdentifier>age</QuestionIdentifier>
#           <DisplayName>What is your age?</DisplayName>
#           <IsRequired>true</IsRequired>
#           <QuestionContent><Text>Please choose the age group you belong to.</Text></QuestionContent>
#           <AnswerSpecification>
#             <SelectionAnswer>
#               <StyleSuggestion>radiobutton</StyleSuggestion>
#               <Selections>
#                 <Selection><SelectionIdentifier>0018</SelectionIdentifier><Text>-18</Text></Selection>
#                 <Selection><SelectionIdentifier>5160</SelectionIdentifier><Text>51-60</Text></Selection>
#                 <Selection><SelectionIdentifier>6000</SelectionIdentifier><Text>60+</Text></Selection>
#               </Selections>  
#             </SelectionAnswer>
#           </AnswerSpecification>
#         </Question> 
#       </QuestionForm>
#     </Test>
#     <TestDurationInSeconds>1200</TestDurationInSeconds>
#   </QualificationType>

module RTurk

  class QualificationTypeParser < RTurk::Parser
    attr_reader :qualification_type_id, :creation_time, :name, :description,
                :keywords, :status, :retry_delay_in_seconds, :is_requestable,
                :test, :test_duration_in_seconds, :answer_key, :auto_granted,
                :auto_granted_value

    def initialize(hit_xml)
      @xml_obj = hit_xml
      map_content(@xml_obj,
        :qualification_type_id => 'QualificationTypeId',
        :creation_time => 'CreationTime',
        :name => 'Name',
        :description => 'Description',
        :keywords => 'Keywords',
        :status => 'QualificationTypeStatus',
        :retry_delay_in_seconds => 'RetryDelayInSeconds',
        :is_requestable => 'IsRequestable',
        :test => 'Test',
        :test_duration_in_seconds => 'TestDurationInSeconds',
        :answer_key => 'AnswerKey',
        :auto_granted => 'AutoGranted',
        :auto_granted_value => 'AutoGrantedValue'
      )

      @keywords = @keywords.split(', ') if @keywords
    end
  end
end
