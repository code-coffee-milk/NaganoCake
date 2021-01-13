class Batch::DataReset
  def self.data_reset
    # 投稿を全て削除
    Customer.delete_all
    p "客を全て削除しました"
  end
end