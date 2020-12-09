# POTEPAN RUBY 実践課題　
# 2_rock-paper-scissors_app
# よろしくお願いいたします！！

@rock_paper_scissors = ["グーを出した","チョキを出した","パーを出した","戦わない"]
@four_directions = ["上","下","左","右"]
puts "じゃんけん..."

def r_p_s

  puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"
  _player = gets.to_i
  _player_3 = @rock_paper_scissors[_player]
  _cpu = rand(3).to_i
  _cpu_3 = @rock_paper_scissors[_cpu]
  _result = _player - _cpu
  puts "ホイ!"
  puts "---------------"
  puts "あなた：#{_player_3}"
  puts "相手：#{_cpu_3}"
  puts "---------------"
  if _player == 3
    puts "また来てね"
    return false
  elsif _result ==  -2 || _result == -1 ||  _result == 1 || _result == 2 #じゃんけん_決定
    puts "あっち向いて〜"
    puts "0(上) 1(下) 2(左) 3(右)"
    _player_4 = @four_directions[gets.to_i]
    _cpu_4 = @four_directions[rand(4)]
    if _player_4 == nil
      puts "半角数字の0~3を入力してください"
      puts "やり直してください"
      puts "---------------"
      puts "じゃんけん..."
      return true
    end
    puts "ホイ!"
    puts "---------------"
    puts "あなた：#{_player_4}"
    puts "相手：#{_cpu_4}"
    puts "---------------"
    if _player_4 == _cpu_4 #あっちむいてホイ_決定
      puts "あなたの勝ちです" if _result == -1 || _result == 2
      puts "あなたの負けです" if _result == -2 || _result == 1
      return false
    elsif _player_4 != _cpu_4 #あっちむいてホイ_未決
      puts "じゃんけん..."
      return true
    end
  elsif _result == 0 #じゃんけん_未決
    puts "あいこで"
    return true
  else 
    puts "半角数字0~3を入力してください"
    puts "じゃんけん..."
    return true
  end
end

next_game = true

while next_game 
  next_game = r_p_s
end
