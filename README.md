# あすけんコーディングテスト課題　回答アプリ＆サービス改善提案機能の実装アプリ

|コーディングテスト課題回答アプリ（納豆ご飯の総カロリー計算）|サービス改善提案機能の実装アプリ（自然言語入力でのお手軽版食材データ自動生成機能）|
|:-:|:-:|
|<video src="https://github.com/user-attachments/assets/e6b501e3-5d08-4f8a-bac5-d1534f116781">|<video src="https://github.com/user-attachments/assets/07eac5e7-c9ff-443c-a0e9-129750640810">|

# 概要
あすけんコーディングテスト課題の実装を含んだレポジトリです。

少し面白くしたかった為、

- 課題の回答時のロジックを使った納豆ご飯の総カロリー計算アプリ
- サービス改善提案機能を実装したアプリ（自然言語入力でのお手軽版食材データ自動生成機能）

を一緒に実装しました。

# テスト課題の各設問と、ソースコードの対応について

- 問題１（摂取量(g)からカロリー(kcal)を計算するクラス作成）

 ・ファイル名：[GramToKcalConverter.swift](Sample_CodingTest1/CodingTestAnswer/CodingTestAnswerLogic/GramToKcalConverter.swift)

>「三大栄養素」それぞれについて、摂取量(g)からカロリー(kcal)を計算するクラスを作成し
> てください。
> 尚、桁数についてはそれぞれ以下の通りとします。
> ● 摂取量(g) : 小数第一位 (小数第二位を四捨五入)
> ● カロリー(kcal) : 整数 (小数第一位を四捨五入)

==================

- 問題２（「問題1」で作成したクラスを使用して、「納豆ご飯」の総カロリー(kcal)を計算するコード）

 ・ファイル名：[FixedGramIngredient.swift](Sample_CodingTest1/CodingTestAnswer/CodingTestAnswerLogic_SampleApp/TotalKcalSimulation/FixedGramIngredient.swift)（ getTotalKcal()メソッド）
 　　=> 各食材ごとのPFCのグラム値からカロリーの合計値を計算
 
 ・ファイル名：[TotalKcalSimulationViewModel.swift](Sample_CodingTest1/CodingTestAnswer/CodingTestAnswerLogic_SampleApp/TotalKcalSimulation/TotalKcalSimulationViewModel.swift)（updateTotalKcal()メソッド）
 　　=> 画面で現在選択中ステータスの食材一覧の総カロリーを計算して画面更新

> 「問題1」で作成したクラスを使用して、以下の「納豆ご飯」の総カロリー(kcal)を計算する
> コードを書いてください。
> ● 白米
> ○ P : 2.5g
> ○ F : 0.3g
> ○ C : 37.1g
> ● 納豆
> ○ P : 16.5g
> ○ F : 10.0g
> ○ C : 12.1g

==================

- 問題３（テストコード）

 ・ファイル名：[GramToKcalConverterTests.swift](Sample_CodingTest1Tests/GramToKcalConverterTests.swift)

> 「問題1, 2」を通して作成したクラスの簡単なテストコードを書いてください。 また、可能な限
> りテスト観点についてコメントに記載してください。 コーディングテスト終了後に、どのような
> 観点や意図を持っているかをお聞きいたします。
