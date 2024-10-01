const togglebtn = document.querySelector('.navbar-togglebtn');
const menu = document.querySelector('.navbar-menu');
const aut = document.querySelector('.navbar-aut')

togglebtn.addEventListener('click', () => {
    menu.classList.toggle('active')
    aut.classList.toggle('active')
})
