	// 이메일 인증
    let emailChk = document.querySelector('#emailChk');
    
    // 이메일 인증 액션
    emailChk.addEventListener('click', function() {
    
	// 기존에 있는 경우 삭제
   	let authenChkEl = document.querySelector('#authenChk');

   	if (authenChkEl !== null && authenChkEl !== undefined) {
   	    authenChkEl.remove();
   	}
        
   
    let emailValue = document.querySelector('#email').value;
   	let result = document.querySelector('#chkResult');
   	
   	// 동적인 효과
   	result.textContent = '전송중';
   	
   	// 0.7초마다 . 증가
   	let intervalId = setInterval(function() {
   		result.textContent += ".";
   	}, 700);
   	
   	// ajax 비동기적 메일 전송
    	$.ajax({
    		url : 'sendEmail.do?email='+emailValue,
    		type : 'GET',
    		success : function(rst){
    			// 인터벌 초기화
    			clearInterval(intervalId);
    			result.style.color = 'green';
    			result.textContent = '전송완료!';
    			// 코드값 넘겨줌
    			code = rst;
    			// 인증번호확인 버튼 생성
    			result.insertAdjacentHTML('beforebegin','<input type="button" id="authenChk" class="frm_input" onclick="handleAuthenChk()" value="인증번호 확인">')
    		},
    		error : function(xhr){
    			clearInterval(intervalId);
    			result.style.color = 'red';
    			result.textContent = '전송실패!';
    		}
    	});
    });
    
    function handleAuthenChk() {
    	let result = document.querySelector('#chkResult');
    	let val = document.querySelector('#authenNum').value;
    	
    	if(val === code){
    		result.style.color = 'green';
    		result.textContent = '인증완료!!';
    		document.querySelector('#authenChk').remove();
    		emailChk.remove();
    	}else{
    		result.style.color = 'red';
    		result.textContent = '인증 실패 다시 시도해주세요!';
    	}
    }