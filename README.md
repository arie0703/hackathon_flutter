ハッカソンgit使い方  

①git clone https://github.com/hitodeface/hackathon_flutter.gitでエディタにファイルの内容を入れることができる。    

②エディタで編集するときはdevelopブランチに移動する。（git checkout developとコマンドを入力）  

③編集して更新したら保存してコマンドうつ  
git add -A  
git commit -m 'xxxxxxx'  
git push origin develop    

③Git Hubをブラウザで開き、レポジトリを確認する  

④プルリクエストを送る。developからmasterにファイルの変更が反映される。  

⑤最新の変更内容を自分のパソコンに入れたければ、git pull origin masterをコマンドにうつ。    


developは自分のパソコンで編集する用。masterは常に最新の状態。  
参考記事：https://qiita.com/gold-kou/items/7f6a3b46e2781b0dd4a0
