class Plan < ApplicationRecord
  validates :plan, presence: true
  validates :date, presence: true
  validate :not_before_today  #今日の日付け、今日以降の日付、はデータベースに保存可能。  今日以前の日付け、はデータベースに保存できない。
    def not_before_today
      errors.add(:date, 'Please set today or after today') if date.nil? || date < Date.today
    end
end

