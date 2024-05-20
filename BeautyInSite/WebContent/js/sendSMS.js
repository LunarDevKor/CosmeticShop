	// 이메일 인증
    let phoneChk = document.querySelector('#phoneChk');
	let code = '';
    
    // 이메일 인증 액션
    phoneChk.addEventListener('click', function() {
    
	// 기존에 있는 경우 삭제
   	let el = document.querySelector('#authenChkPhone');

   	if (el !== null && el !== undefined) {
   	    el.remove();
   	}
   
    let phoneValue = document.querySelector('#phone').value;
   	let resultPhone = document.querySelector('#chkResultPhone');
   	
   	// 동적인 효과
   	resultPhone.textContent = '전송중';
   	
   	// 0.7초마다 . 증가
   	let intervalId = setInterval(function() {
   		resultPhone.textContent += ".";
   	}, 700);
 
   	// ajax 비동기적 메일 전송
    	$.ajax({
    		url : 'sendSMS.do?phone='+phoneValue,
    		type : 'GET',
    		success : function(rst){
    			// 인터벌 초기화
    			clearInterval(intervalId);
    			resultPhone.style.color = 'green';
    			resultPhone.textContent = '전송완료!';
				code = rst;
    			// 인증번호확인 버튼 생성
    			resultPhone.insertAdjacentHTML('beforebegin','<input type="button" id="authenChkPhone" class="frm_input" onclick="handleAuthenChkPhone()" value="인증번호 확인">')
    		},
    		error : function(xhr){
    			clearInterval(intervalId);
    			resultPhone.style.color = 'red';
    			resultPhone.textContent = '전송실패!';
    		}
    	});
    });
    
    function handleAuthenChkPhone() {
    	let resultPhone = document.querySelector('#chkResultPhone');
    	let val = document.querySelector('#authenNumPhone').value;
    	if(val === code){
    		resultPhone.style.color = 'green';
    		resultPhone.textContent = '인증완료!!';
    		document.querySelector('#authenChkPhone').remove();
    		phoneChk.remove();
    		document.querySelector('#phone').readOnly = true; 
    	}else{
    		resultPhone.style.color = 'red';
    		resultPhone.textContent = '인증 실패 다시 시도해주세요!';
    	}
    }