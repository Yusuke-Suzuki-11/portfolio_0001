class User < ApplicationRecord
  has_many :chat_messages
  has_many :chat_room_users
  has_many :posts, dependent: :destroy
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :followers, through: :follower_relationships
  has_many :likes
  has_many :comments
  

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 50 }

  enum gender: %i(男子 女子)

  enum sports_event: %i(
    未選択 アーチェリー ウエイトリフティング カヌー ゴルフ サーフィン サッカー スケートボード セーリング ソフトボール テコンドー テニス 軟式テニス トライアスロン バスケットボール バドミントン バレーボール ハンドボール フェンシング ボート ラグビー レスリング 近代五種 空手 自転車 柔道 水泳 体操 卓球 馬術 野球 軟式野球 陸上 肉体改造部
  )

  enum sports_stage: %i( 未設定 中学生 高校生 大学生 社会人 シニア)

  enum sports_level: %i(未記入 趣味 部活 アマチュア プロ)

  def update_without_current_password(params, *options)
    params.delete(:current_password)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end
end
