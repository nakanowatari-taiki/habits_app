require 'rails_helper'
RSpec.describe Plan, type: :model do
  before do
    @plan = FactoryBot.build(:plan)
  end
  describe '投稿機能'do
   context '投稿機能がうまくいかないとき' do
    it'part_idが空では投稿できない'do
      @plan.part_id =""
      @plan.valid?
      expect(@plan.errors.full_messages).to include("Part can't be blank") 
    end
    it'textが空では投稿できない'do
      @plan.text =""
      @plan.valid?
      expect(@plan.errors.full_messages).to include("Text can't be blank") 
     end
    it'dateが空では投稿できない'do
      @plan.date =""
      @plan.valid?
      expect(@plan.errors.full_messages).to include("Date can't be blank") 
    end
    it 'part_idはidが１以外出ないと登録できない'do
      @plan.part_id = 1
      @plan.valid?
      expect(@plan.errors.full_messages).to include("Part must be other than 1") 
    end
   end
   context '投稿機能がうまくいく時' do
    it 'part_id,text,dateがあれば投稿できる'do
      expect(@plan).to be_valid
    end
   end
  end
end