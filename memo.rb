require"csv"

puts"1(新規でメモを作成)2(既存のメモを編集する)"

memo_type = gets.to_i #1か2の判断用。数値型に変換

if memo_type == 1 #ファイル作成
    puts "拡張子を除いたファイル名を入力してください"
    name = gets.chomp #ファイル名記入
    CSV.open("#{name}.csv",'w',:encoding => "utf-8",:quote_char => '') do|csv|
    puts "メモしたい内容を記入してください"
    puts "完了したらctrl + Dを押してください"
    csv << [STDIN.read] #メモに記入する内容を記入
end

elsif memo_type == 2 #ファイル追記
    puts "編集するファイル名を入力してください。"
    name = gets.chomp
    file_name = Dir.glob("*.csv") #フォルダ内のcsvファイル取得
    no_file = 0 #ファイルがなかった時用の変数
    file_name.each do |file| #同名ファイルがあるかファイルの確認
    if file == "#{name}.csv"
        puts"追加する内容を入力してください。"
        CSV.open("#{name}.csv",'a',:encoding => "utf-8",:quote_char => '') do|csv|
        csv << [STDIN.read] #追記する内容を記入
        no_file = 1
        next
    end #CSV.openのend
        puts "追記しました"
    end #ifのend
    end #each doのend
    if no_file != 1 #同名ファイルがなかった時の処理
        puts"ファイルがありません"
    end
else #1or2以外の文字を入力した時の処理
    puts"1か2を押してください。"
end