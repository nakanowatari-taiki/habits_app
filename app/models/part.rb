class Part < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択してください' },
    { id: 2, name: '筋トレ' },
    { id: 3, name: 'ランニング' },
    { id: 4, name: 'ストレッチ' },
    { id: 5, name: 'Fitness情報' },
    { id: 6, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :plans
  
end
