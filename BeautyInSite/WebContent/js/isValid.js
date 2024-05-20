let inputs = document.querySelectorAll('.frm_input');
let errMsg = '';

let idRegex = /^[a-zA-Z0-9].{4,12}$/;
let pwRegex = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,20}$/;
let nameRegex = /^[가-힣]{2,5}$/;
let phoneRegex = /^(010)[0-9]{3,4}[0-9]{4}$/;
let emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
let birthRegex = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/;

for (var i = 0; i < inputs.length; i++) {
   if (inputs[i].type !== 'hidden') {

      inputs[i].onkeyup = function(e) {
            switch (e.target.id) {
                case 'id':
                    let flag = updateErrMsg(e.target, idRegex);
                    console.log(e.target.value);
                    if(flag) dupChkId(e.target.value);
                    break;
                case 'pw':
                    updateErrMsg(e.target, pwRegex);
                    break;
                case 'pwChk':
                    pwMatch();
                    break;
                case 'birth':
                	console.log('누름');
                	updateErrMsg(e.target, birthRegex);
                	break;
                case 'name':
                    updateErrMsg(e.target, nameRegex);
                    break;
                case 'phone':
                    updateErrMsg(e.target, phoneRegex);
                    break;
                case 'email':
                    updateErrMsg(e.target, emailRegex);
                    break;
                default:
                    break;
            }
        }
    }
}

function dupChkId(e) {
	console.log('실행됐음');
	let value = e;
	console.log(value);
	
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "idCheck.do?id="+value, true);
	
	xhr.onreadystatechange = function (){
		if(xhr.readyState == 4 && xhr.status == 200) {
			console.log(xhr.status);
			console.log(xhr.responseText);
			displayMessage(xhr.responseText);
		} 
	}
	
	xhr.responseType = "text";
	
	xhr.send();
};

function displayMessage(msg) {
	var el = document.querySelector('#idErr');
	let successTag = '<p style="font-size: 11px; color:#4caf50;">';
	let failureTag = '<p style="font-size: 11px; color:red;">';
	
	msg = msg == 'SUCCESS' ? 
			successTag + '사용가능한 아이디입니다.</p>' 
			: failureTag+'사용할 수 없는 아이디입니다. 다른 아이디를 입력해 주세요.</p>'
			
	el.insertAdjacentHTML('beforeend', msg);
}

function updateErrMsg(field, regex){
    let errMsgEl = document.getElementById(field.id+'Err');
    let value = field.value.trim();
    let placeholder = field.placeholder;
    let info = field.dataset.info;
    let flag = false;

          if(value === ''){
            errMsg = placeholder + '는(은) 필수 정보입니다.';
            field.classList.add('invalid');
          }
          else if (!regex.test(value)) {
             errMsg = placeholder + '가(이) 유효하지 않습니다.';
             field.classList.add('invalid');
          }
          else {
             errMsg = '';
             info = '';
             field.classList.remove('invalid');
             flag = true;
          }
          
    errMsgEl.textContent = errMsg;
    errMsgEl.insertAdjacentHTML('beforeend','<br><p style="font-size: 11px;">' + info + '</p>');
    
    return flag;
}

function pwMatch() {
    let pw = document.querySelector('#pw').value.trim();
    let pwChk = document.querySelector('#pwChk');

    let errMsgEl = document.querySelector('#pwChkErr');

    if(pw !== pwChk.value.trim()){
        errMsg = '비밀번호가 일치하지 않습니다.';
        pwChk.classList.add('invalid');
    }
    else {
        errMsg = '';
        pwChk.classList.remove('invalid');
    }

    errMsgEl.textContent = errMsg;
}