module ValidationHelpers
  def expect_validation_errors(errors, expected)
    expected.each do |field, message|
      Array(message).each {
        |msg| expect(errors[field]).to include(msg)
      }
    end
  end
end
