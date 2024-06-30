const password = document.querySelector(".password");
const showpass = document.querySelector(".showpass");

showpass.addEventListener('click', function(){
    if(password.type === 'password'){
        password.type = 'text';
        showpass.style.color = '#2691d9'; 
        password.style.color = '#2691d9';
        showpass.textContent = "HIDE";
    }else{
        password.type = 'password';
        showpass.textContent = "SHOW";
        password.style.color = '#222';
        showpass.style.color = '#222';
    }
});