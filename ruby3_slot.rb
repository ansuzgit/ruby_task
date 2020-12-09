# POTEPAN RUBY 実践課題　
# 3_slot_app
# よろしくお願いいたします

@coins = 100
@points = 0

def slotgame
  if @coins < 10
    puts "コインが少ないので、もう遊べません。"
    puts "いつかまた来てね！"
    return false
  end
  puts "--------------------"
  puts "残りコイン数：#{@coins}"
  puts "ポイント：#{@points}"
  puts "何コイン入れますか？"
  puts "1(10コイン) 2(30コイン) 3(50コイン) 4(やめとく)"
  puts "--------------------"
  _bet = gets.to_i
  return false if _bet > 3 || _bet == 0
  puts "エンターを3回押しましょう！"
  
  _slot = []
  _enter = gets
  _slot << [rand(9),rand(9),rand(9)]
  puts "--------------------"
  puts "|#{_slot[0][0]}|||"
  puts "|#{_slot[0][1]}|||"
  puts "|#{_slot[0][2]}|||"
  _enter = gets
   _slot << [rand(9),rand(9),rand(9)]
  puts "--------------------"
  puts "|#{_slot[0][0]}|#{_slot[1][0]}||"
  puts "|#{_slot[0][1]}|#{_slot[1][1]}||"
  puts "|#{_slot[0][2]}|#{_slot[1][2]}||"
  _enter = gets
   _slot << [rand(9),rand(9),rand(9)]
  puts "--------------------"
  puts "|#{_slot[0][0]}|#{_slot[1][0]}|#{_slot[2][0]}|"
  puts "|#{_slot[0][1]}|#{_slot[1][1]}|#{_slot[2][1]}|"
  puts "|#{_slot[0][2]}|#{_slot[1][2]}|#{_slot[2][2]}|"
  puts "--------------------"
  puts "--------------------"
  _count = 0
  #横
  _count += 1 if _slot[0][0] == _slot[1][0] && _slot[0][0] == _slot[2][0]
  _count += 1 if _slot[0][1] == _slot[1][1] && _slot[0][1] == _slot[2][1]
  _count += 1 if _slot[0][2] == _slot[1][2] && _slot[0][2] == _slot[2][2]
  #縦
  _count += 1 if _slot[0][0] == _slot[0][1] && _slot[0][0] == _slot[0][2]
  _count += 1 if _slot[1][0] == _slot[1][1] && _slot[1][0] == _slot[1][2]
  _count += 1 if _slot[2][0] == _slot[2][1] && _slot[2][0] == _slot[2][2]
  #斜め
  _count += 1 if _slot[0][0] == _slot[1][1] && _slot[0][0] == _slot[2][2]
  _count += 1 if _slot[0][2] == _slot[1][1] && _slot[2][0] == _slot[0][2]
  
  if _count != 0 #あたり
    puts "#{_count} 行/列、揃いました。" 
    @coins = @coins + _count * ( 10 + ( _bet - 1) * 20 )
    @points = @points +  ( 10 + ( _bet - 1) * 20 ) * 10
    return true
  else #はずれ
    @coins = @coins -  ( 10 + ( _bet - 1) * 20 )
    puts "揃いませんでした。"
    return true
  end
end

_next_game = true

while _next_game
  _next_game = slotgame
end