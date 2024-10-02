//================================== 이름 모달창====================================================
const modal_name = document.querySelector(".mypage-modal-wrapper");
const modal_box_name = document.querySelector(".mypage-modal")
const showupModalBtn_name = document.querySelector(".name-popup");
const closeModalBtn_name = document.querySelector(".name-closebtn")

showupModalBtn_name.addEventListener("click", ()=> {
    modal_name.style.display="flex";
    modal_box_name.style.display="block";
});

closeModalBtn_name.addEventListener("click", ()=> {
    modal_name.style.display='none';
    modal_box_name.style.display='none';
} );
/*================================== 아이디 모달창====================================================
const modal_id = document.querySelector(".id-modal-wrapper");
const modal_box_id = document.querySelector(".mypage-id-modal");
const showupModalBtn_id = document.querySelector(".id-popup");
const closeModalBtn_id = document.querySelector(".id-closebtn");

showupModalBtn_id.addEventListener("click", ()=> {
    modal_id.style.display="flex";
    modal_box_id.style.display="block";
});

closeModalBtn_id.addEventListener("click", ()=> {
    modal_id.style.display='none';
    modal_box_id.style.display='none';
} );*/
//================================== 전화번호 모달창====================================================
const modal_tell = document.querySelector(".tell-modal-wrapper");
const modal_box_tell = document.querySelector(".mypage-tell-modal");
const showupModalBtn_tell = document.querySelector(".tell-popup");
const closeModalBtn_tell = document.querySelector(".tell-closebtn");

showupModalBtn_tell.addEventListener("click", ()=> {
    modal_tell.style.display="flex";
    modal_box_tell.style.display="block";
});

closeModalBtn_tell.addEventListener("click", ()=> {
    modal_tell.style.display='none';
    modal_box_tell.style.display='none';
} );
//================================== 이메일 모달창====================================================
const modal_email = document.querySelector(".email-modal-wrapper");
const modal_box_email = document.querySelector(".mypage-email-modal");
const showupModalBtn_email = document.querySelector(".email-popup");
const closeModalBtn_email = document.querySelector(".email-closebtn");

showupModalBtn_email.addEventListener("click", ()=> {
    modal_email.style.display="flex";
    modal_box_email.style.display="block";
});

closeModalBtn_email.addEventListener("click", ()=> {
    modal_email.style.display='none';
    modal_box_email.style.display='none';
} );
//================================== 패스워드 모달창====================================================
const modal_pw = document.querySelector(".pw-modal-wrapper");
const modal_box_pw = document.querySelector(".mypage-pw-modal");
const showupModalBtn_pw = document.querySelector(".pw-popup");
const closeModalBtn_pw = document.querySelector(".pw-closebtn");

showupModalBtn_pw.addEventListener("click", ()=> {
    modal_pw.style.display="flex";
    modal_box_pw.style.display="block";
});

closeModalBtn_pw.addEventListener("click", ()=> {
    modal_pw.style.display='none';
    modal_box_pw.style.display='none';
} );
//================================== 탈퇴 모달창====================================================
const modal_out = document.querySelector(".out-modal-wrapper");
const modal_box_out = document.querySelector(".mypage-out-modal");
const showupModalBtn_out = document.querySelector(".out-popup");
const closeModalBtn_out = document.querySelector(".out-closebtn");

showupModalBtn_out.addEventListener("click", ()=> {
    modal_out.style.display="flex";
    modal_box_out.style.display="block";
});

closeModalBtn_out.addEventListener("click", ()=> {
    modal_out.style.display='none';
    modal_box_out.style.display='none';
} );
