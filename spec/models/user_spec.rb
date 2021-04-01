require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
describe 'ユーザー新規登録機能'do
  context '新規登録がうまくいかないとき' do
  it'nicknameが空では登録できない'do
    @user.nickname =""
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank") 
  end
  it'emailが空では登録できない'do
    @user.email = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank") 
  end
  it'emailは＠がないと登録できない'do
    @user.email="hoge.com"
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid") 
  end
  it '重複したemailが存在する場合は登録できない' do
    @user.save
    another_user = FactoryBot.build(:user, email: @user.email)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
  end
  it'passwordは空では登録できない'do
    @user.password =""
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank") 
  end
  it 'passwordは６文字以上であること' do
    @user.password = "11111"
    @user.password_confirmation = "11111"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end
  it 'passwordは半角英数字が必要であること' do
    @user.password = "aaaaaa"
    @user.password_confirmation = "aaaaaa"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end
  it 'passwordは確認用を含めて2回入力すること' do
    @user.password_confirmation = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  it 'passwordと確認用passwordの値が一致すること' do
    @user.password = "aaaaa5"
    @user.password_confirmation = "aaaaa6"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  it 'passwordは数字のみでは登録できない' do
    @user.password = "555555"
    @user.password_confirmation = "555555"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end

  it 'passwordは全角では登録できない' do
    @user.password = "おおおおa1"
    @user.password_confirmation = "おおおおa1"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end
 end
  
 context '新規登録がうまくいく時' do
  it 'passwordは６文字以上且、半角英数字で登録できる'do
    @user.password = "hoge12"
    @user.password_confirmation = "hoge12"
    expect(@user).to be_valid
  end
  it "nickname,email,password,password_confirmartionがあれば新規登録できる"do
    expect(@user).to be_valid
  end
  it "emailとpasswordがあればログインできる" do
    @user.email = "hoge@co.jp"
    @user.password = "hoge12"
    expect(@user).to be_valid
  end
  it "passwordは６文字以上且、半角英数字で登録できる"do
    @user.password = "hoge12"
    @user.password_confirmation = "hoge12"
    expect(@user).to be_valid
  end
    it "emailは@があれば登録できる"do
    @user.email = "hoge@co.jp"
    expect(@user).to be_valid
  end
  end

 end
end

