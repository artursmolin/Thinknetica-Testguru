module TestPassagesHelper

  def result_test
      question_size = @test_passage.test.questions.size.to_f
      correct_size =  @test_passage.correct_question.to_f
      result = ((correct_size / question_size))*100
  end
end
