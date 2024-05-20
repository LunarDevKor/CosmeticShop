/* 	success : 성공
	error : 실패
	warning : 경고
	info : 정보
	question : 질문
	
	
	
	alert
	comfrim
	toast
	prompt : (example)
	
	(async () => {
    const { value: getName } = await Swal.fire({
        title: '당신의 이름을 입력하세요.',
        text: '그냥 예시일 뿐이니 정보유출 같은건 없습니다.',
        input: 'text',
        inputPlaceholder: '이름을 입력..'
    })

    // 이후 처리되는 내용.
    if (getName) {
        Swal.fire(`: ${getName}`)
    }
})();


*/

const Toast = Swal.mixin({
	toast: true,
	position: 'center',
	showConfirmButton: false,
	timer: 1000,
	timerProgressBar: false,
	hideClass: {
		popup: 'animate__animated animate__fadeOut'
	},
	
	didOpen: (toast) => {
		toast.addEventListener("mouseenter", Swal.stopTimer);
		toast.addEventListener("mouseleave", Swal.resumeTimer);
	}
});