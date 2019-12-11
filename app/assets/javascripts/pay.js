
// DOM読み込みが完了したら実行
document.addEventListener('DOMContentLoaded', (e) => {
  // payjp.jsの初期化
  if (document.getElementById("token") != null) { 
  Payjp.setPublicKey('pk_test_aa0e2a0eb226ca3ad7f22a9c');
  // ボタンのイベントハンドリング
  const btn = document.getElementById('token');
  btn.addEventListener('click', (e) => {
    e.preventDefault();
    
    // カード情報生成
    const card = {
      number: document.getElementById('card_number').value,
      cvc: document.getElementById('cvc').value,
      exp_month: document.getElementById('exp_month').value,
      exp_year: document.getElementById('exp_year').value
    };
    
    // トークン生成
    Payjp.createToken(card, (status, response) => { 
      if (status === 200) {
        $("#card_number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        $("#charge-form").append(
          $('<input type="hidden" name="payjp-token">').val(response.id)
        ); 
        // 出力（本来はサーバへ送信）
        document.inputForm.submit();
        alert("登録が完了しました"); //確認用
      }else {
        alert("カード情報が正しくありません。"); //確認用
      }
    });
  });
};
}, 
false);


