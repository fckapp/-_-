$(document).ready(function() {
    // 이름 수정 AJAX
    $('#saveName').click(function() {
        const newName = $('#newName').val();
        $.ajax({
            url: "updateName",
            type: 'POST',
            data: { name: newName,  },
            success: function(response) {
                // 수정 성공 시 모달 닫기 및 페이지 새로고침
				$('#currentName').text(newName);
                alert('이름이 수정되었습니다.');
                location.reload();
            },
            error: function() {
                alert('이름 수정 실패.');
            }
        });
    });

    // 전화번호 수정 AJAX
    $('#savePhone').click(function() {
        const newTell = $('#newTell').val();
        $.ajax({
            url: "updateTell",
            type: 'POST',
            data: { phone: newTell},
            success: function(response) {
                // 수정 성공 시 모달 닫기 및 페이지 새로고침
                alert('전화번호가 수정되었습니다.');
                location.reload();
            },
            error: function() {
                alert('전화번호 수정 실패.');
            }
        });
    });
	
	// 이메일 수정 AJAX
	$('#sendVerification').click(function() {
        const newEmail = $('#newEmail').val();
        $.ajax({
            url: "updateEmail",
            type: 'POST',
            data: { newEmail: newEmail},
            success: function(response) {
                // 수정 성공 시 모달 닫기 및 페이지 새로고침
                alert('인증번호 발송 성공');
            },
            error: function() {
                alert('인증번호 전송 실패.');
            }
        });
    });
});
