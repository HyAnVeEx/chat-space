require 'rails_helper'

describe Message do
  describe '#create' do
    it "is valid with a content" do
      message = build(:message, image:nil)
      expect(message).to be_valid
    end

    it "is valid with a image" do
      message = build(:message, content:nil)
      expect(message).to be_valid
    end

    it "is valid with a content, image" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is invalid without a content, image" do
      message = build(:message, content: nil, image: nil,)
      message.valid?
      expect(message).not_to be_valid
    end

    it "is invalid without a group_id" do
      message = build(:message, group_id: nil)
      message.valid?
      expect(message).not_to be_valid
    end

    it "is invalid without a user_id" do
      message = build(:message, user_id: nil)
      message.valid?
      expect(message).not_to be_valid
    end
  end
end
