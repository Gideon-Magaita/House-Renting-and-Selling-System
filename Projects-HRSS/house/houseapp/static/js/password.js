const password = document.querySelector("#password");
const TogglePassword = document.querySelector(".TogglePassword");

const handleToggleInput=(e)=>{
if (TogglePassword.textContent==='SHOW'){
    TogglePassword.textContent='HIDE';

    password.setAttribute("type","text");
}else{
    TogglePassword.textContent='SHOW';
    password.setAttribute("type","password");
}

};

TogglePassword.addEventListener("click",handleToggleInput);