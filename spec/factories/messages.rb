FactoryGirl.define do
  factory :message do
    content              Faker::Zelda.character
    image                Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.jpg'))
  end
end
