# POTEPAN RUBY 実践課題　
# 1_MEMO_app

require "csv"

puts "1(新規でメモを作成) 2(既存のメモを編集する)"
memo_type = gets.to_i

if memo_type == 1 
  puts "拡張子を除いたファイル名を入力してください"
  memo_name = gets.to_s
  puts "追記したい内容を入力してください"
  puts "完了したら、Ctrl+Dを押してください"
  memo_contents = readlines
  CSV.open("#{memo_name}.csv", "w") do |row|
    row << memo_contents
  end
  puts "----------------------"
  puts "ファイルを保存しました"
elsif memo_type == 2
  puts "編集したいメモのファイル名を"
  puts "教えてください(拡張子を除く)"
  memo_name = gets.to_s
  if File.exists?("#{memo_name}.csv")
    puts "ファイル名: #{memo_name}"
    puts "-----以下がメモの内容-----"
    CSV.foreach("#{memo_name}.csv") do |row|
      p row
    end
    puts "--------------------------"
    puts "こちらでお間違いないですか"
    puts "1(はい) 2(いいえ)"
    yes_or_no = gets.to_i
    if yes_or_no == 1
      puts "メモしたい内容を入力してください"
      puts "完了したら、Ctrl+Dを押してください"
      memo_contents = readlines
      CSV.open("#{memo_name}.csv", "a") do |row|
        row << memo_contents
      end
      puts "----------------------"
      puts "ファイルを保存しました"
    else
      puts "最初からやり直してください"
    end
  else
    puts "ファイル(#{memo_name})は存在しません"
    puts "最初からやり直してください"
  end
else
  puts "半角数字で「1」か「2」を入力してください"
  puts "最初からやり直してください"
end
